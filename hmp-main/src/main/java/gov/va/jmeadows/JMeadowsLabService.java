package gov.va.jmeadows;

import gov.va.cpe.idn.PatientIds;
import gov.va.cpe.vpr.JdsCode;
import gov.va.cpe.vpr.UidUtils;
import gov.va.cpe.vpr.pom.JSONViews.JDBView;
import gov.va.cpe.vpr.sync.vista.VistaDataChunk;
import gov.va.med.jmeadows.webservice.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import javax.xml.datatype.XMLGregorianCalendar;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import static gov.va.jmeadows.JMeadowsClientUtils.*;

/**
 * JMeadows Chem Lab Service
 */
@Service
public class JMeadowsLabService implements IJMeadowsLabService {

    public static final String DOMAIN_LAB = "lab";
    static final Logger LOG = LoggerFactory.getLogger(JMeadowsLabService.class);

    //used to parse low and high reference range values
    private final static String REFERENCE_RANGE_REGEX = "\\(*(\\d*\\.*\\d*)\\s*-\\s*(\\d*\\.*\\d*)\\)*";

    private Pattern referenceRangePattern;

    private JMeadowsData jMeadowsClient;

    /**
     * Constructs a JMeadowsLabService instance.
     */
    @Autowired
    public JMeadowsLabService(JMeadowsConfiguration jMeadowsConfiguration)
    {
        jMeadowsClient = JMeadowsClientFactory.getInstance(jMeadowsConfiguration);

        this.referenceRangePattern= Pattern.compile(REFERENCE_RANGE_REGEX);
    }

    /**
     * Sets JMeadowsClient
     * @param jMeadowsClient JMeadows client instance.
     */
    public void setJMeadowsClient(JMeadowsData jMeadowsClient)
    {
        this.jMeadowsClient = jMeadowsClient;
    }



    public List<VistaDataChunk> fetchDodPatientChemistryLabs(JMeadowsQuery query, PatientIds patientIds) throws JMeadowsException_Exception {

        LOG.debug("JMeadowsLabService.fetchDodPatientChemistryLabs - Entering method...");

        List<VistaDataChunk> oaLabChunk = new ArrayList<VistaDataChunk>();

        List<LabResult> oaLabResults = jMeadowsClient.getPatientLabResults(query);
        LOG.debug("JMeadowsLabService.fetchPatientChemistryLabResults: " +
                ((oaLabResults == null)? "NO" : ""+oaLabResults.size()) +
                " Labs retrieved from JMeadows.");



        if ((oaLabResults != null) && (oaLabResults.size() > 0)) {

            oaLabResults = (List<LabResult>) filterOnSourceProtocol(oaLabResults, SOURCE_PROTOCOL_DODADAPTER);
            int iNumLabs = calculateNumLabs(oaLabResults);
            int iCurLabIdx = 1;		// One based index
            for(LabResult oLab : oaLabResults)
            {
                String accession = oLab.getAccession();
                if(accession.toUpperCase().contains("^CH"))   //is a chem lab
                {
                    LOG.debug("JMeadowsLabService.fetchDodPatientChemistryLabs: Found DoD LabResult - Processing it... idx: " + iCurLabIdx);
                    VistaDataChunk oLabChunk = transformLabChunk(oLab, patientIds, iNumLabs, iCurLabIdx);
                    if (oLabChunk != null) {
                        oaLabChunk.add(oLabChunk);
                        iCurLabIdx++;
                    }

                }

            }
        }

        return oaLabChunk;
    }

    public List<VistaDataChunk> fetchDodPatientAnatomicPathologyLabs(JMeadowsQuery query, PatientIds patientIds) throws JMeadowsException_Exception {

        LOG.debug("JMeadowsLabService.fetchDodPatientAnatomicPathologyLabs - Entering method...");

        List<VistaDataChunk> oaLabChunk = new ArrayList<VistaDataChunk>();

        List<LabResult> oaLabResults = jMeadowsClient.getPatientLabResults(query);
        LOG.debug("JMeadowsLabService.fetchPatientLabResults: " +
                ((oaLabResults == null)? "NO" : ""+oaLabResults.size()) +
                " Labs retrieved from JMeadows.");



        if ((oaLabResults != null) && (oaLabResults.size() > 0)) {

            oaLabResults = (List<LabResult>) filterOnSourceProtocol(oaLabResults, SOURCE_PROTOCOL_DODADAPTER);
            int iNumLabs = calculateNumLabs(oaLabResults);
            int iCurLabIdx = 1;		// One based index
            for(LabResult oLab : oaLabResults)
            {
                String accession = oLab.getAccession();
                if(accession.toUpperCase().contains("^AP"))   //is a anatomic pathology lab
                {
                    LOG.debug("JMeadowsLabService.fetchPatientAnatomicPathologyLabs: Found DoD LabResult - Processing it... idx: " + iCurLabIdx);
                    VistaDataChunk oLabChunk = transformLabChunk(oLab, patientIds, iNumLabs, iCurLabIdx);
                    if (oLabChunk != null) {
                        oaLabChunk.add(oLabChunk);
                        iCurLabIdx++;
                    }

                }

            }
        }

        return oaLabChunk;
    }


    /**
     * This routine will calculate the total number of labs that are in the result set.  It does this by
     * counting all the labs that are part of the DoD domain.  We ignore all that are from any VistA site.
     *
     * @param oaLabs The list of labs returned.
     * @return The number of labs that are from a DoD site.
     */
    private int calculateNumLabs(List<LabResult> oaLabs) {

        int iNumLabs = 0;
        if ((oaLabs != null) && (oaLabs.size() > 0)) {
            for (LabResult oLab : oaLabs) {
                iNumLabs++;
            }
        }

        return iNumLabs;
    }



    /**
     * Create an instance of a VistaDataChunk that represents this lab.
     *
     * @param oLab The chem lab that was returned from JMeadows
     * @param oPatientIds Patient identifiers.
     * @param iNumLabs The number of labs
     * @param iCurLabIdx The index of this lab in the list.
     * @return The VistaDataChunk for this lab.
     */

    private VistaDataChunk transformLabChunk(LabResult oLab, PatientIds oPatientIds, int iNumLabs, int iCurLabIdx) {

        LOG.debug("JMeadowsLabService.transformLabChunk - Entering method...");

        VistaDataChunk oLabChunk = new VistaDataChunk();

        oLabChunk.setAutoUpdate(false);
        oLabChunk.setDomain(DOMAIN_LAB);
        oLabChunk.setItemCount(iNumLabs);
        oLabChunk.setItemIndex(iCurLabIdx);

        String sSystemId = "";
        String sLocalPatientId = "";

        if (StringUtils.hasText(oPatientIds.getUid())) {
            sSystemId = UidUtils.getSystemIdFromPatientUid(oPatientIds.getUid());
            sLocalPatientId = UidUtils.getLocalPatientIdFromPatientUid(oPatientIds.getUid());
            oLabChunk.setLocalPatientId(sLocalPatientId);
            oLabChunk.setSystemId(sSystemId);

            HashMap<String, String> oParams = new HashMap<String, String>();
            oParams.put("vistaId", sSystemId);
            oParams.put("patientDfn", sLocalPatientId);
            oLabChunk.setParams(oParams);
        }

        oLabChunk.setPatientIcn(oPatientIds.getIcn());
        oLabChunk.setPatientId(oPatientIds.getPid());
        oLabChunk.setRpcUri("vrpcb://9E7A/VPR SYNCHRONIZATION CONTEXT/VPRDJFS API");
        oLabChunk.setType(VistaDataChunk.NEW_OR_UPDATE);

        oLabChunk.setContent(transformLabJson(oLab, "DOD", oPatientIds.getEdipi()));

        return oLabChunk;
    }


    /**
     * This method will transform the chem lab from the DoD JMeadows format to the VPR format and return it as a
     * JSON string.
     *
     * @param oLab The DoD JMeadows format of the data.
     * @param sSystemId The site system ID
     * @param sEdipi The patient EDIPI
     * @return The JSON for this lab data in VPR format.
     */

    private String transformLabJson(LabResult oLab, String sSystemId, String sEdipi) {

        LOG.debug("JMeadowsLabService.transformLabJson - Entering method...");

        gov.va.cpe.vpr.Result result = new gov.va.cpe.vpr.Result();

        if ((oLab.getCodes() != null) &&
                (oLab.getCodes().size() > 0)) {
            List<JdsCode> oaJdsCode = new ArrayList<JdsCode>();
            for (Code oCode : oLab.getCodes()) {
                boolean bHasData = false;
                JdsCode oJdsCode = new JdsCode();
                if ((oCode.getCode() != null) && (oCode.getCode().length() > 0)) {
                    oJdsCode.setCode(oCode.getCode());
                    bHasData = true;
                }


                if ((oCode.getSystem() != null) && (oCode.getSystem().length() > 0)) {
                    JLVTerminologySystem termSystem = JLVTerminologySystem.getSystemByName(oCode.getSystem());

                    //pass OID urn if one exists
                    if (termSystem != null) {
                        oJdsCode.setSystem(termSystem.getUrn());
                    }
                    //default to code system display name
                    else oJdsCode.setSystem(oCode.getSystem());

                    bHasData = true;


                }

                if ((oCode.getDisplay() != null) && (oCode.getDisplay().length() > 0)) {
                    oJdsCode.setDisplay(oCode.getDisplay());
                    bHasData = true;
                }

                if (bHasData) {
                    oaJdsCode.add(oJdsCode);
                }
            }

            if (oaJdsCode.size() > 0) {
                result.setData("codes", oaJdsCode);
            }
        }

        ///===
        result.setData("facilityCode", sSystemId);
        result.setData("facilityName", oLab.getFacilityName());

        result.setData("localId", oLab.getAccession());

        String labType = getLabType(oLab.getAccession());
        String categoryCode = getCategoryCode(labType);

        result.setData("categoryCode", categoryCode);
        result.setData("categoryName", getLabCategoryName(labType));

        result.setData("statusCode", getStatusCode(oLab.getResultStatus()));
        result.setData("statusName", getStatusName(oLab.getResultStatus()));

        XMLGregorianCalendar orderedCalendar = oLab.getOrderDate();
        if (orderedCalendar != null) {
            result.setData("observed", formatCalendar(orderedCalendar.toGregorianCalendar()));
        }

        XMLGregorianCalendar resultedCalendar = oLab.getResultDate();
        if (resultedCalendar != null) {
            result.setData("resulted", formatCalendar(resultedCalendar.toGregorianCalendar()));
        }

        result.setData("specimen", oLab.getSpecimen());
        result.setData("orderId", oLab.getOrderId());
        result.setData("comment", oLab.getComment());
        result.setData("units", oLab.getUnits());

        result.setData("result", oLab.getResult());
        result.setData("summary", getSummary(oLab));
        result.setData("kind",  getLabCategoryName(labType));
        result.setData("displayName", oLab.getTestName());

        if (StringUtils.hasText(oLab.getReferenceRange())) {
            //parse low and high values
            Map<String, String> refRangeMap = parseReferenceRange(oLab.getReferenceRange());

            if (!refRangeMap.isEmpty()) {
                result.setData("low", refRangeMap.get("low"));
                result.setData("high", refRangeMap.get("high"));
            }
        }

        if (labType.equals("AP")) {
            result.setData("organizerType", "accession");
            result.setData("typeName", null);
        } else {
            result.setData("organizerType", "organizerType");
            result.setData("typeName", oLab.getTestName());
        }

        result.setData("uid", createUid(DOMAIN_LAB, sSystemId, sEdipi, oLab.getCdrEventId()));

        String sLabJson = result.toJSON(JDBView.class);
        LOG.debug("JMeadowsLabService.transformLabJson - Returning JSON String: " + sLabJson);
        return sLabJson;
    }

    /**
     * Extracts low and high values from a DoD Adaptor reference range string.
     * @param referenceRange Reference range string.
     *
     *  Possible reference range string variations include:
     *
     *  .2-1.3
     *   6.3-8.2
     *   2.5-6.2
     *   .35-4.94
     *   null
     *   5.0-7.0
     *   NEGATIVE
     *   0.0-2.5
     *
     * @return Map containing low & high key,value pairs.
     */
    protected Map<String, String> parseReferenceRange(String referenceRange) {
        //parse low and high values
        Matcher matcher = this.referenceRangePattern.matcher(referenceRange);

        Map<String, String> refRangeMap = new HashMap<>();

        try {
            if(matcher.find() && matcher.groupCount() == 2) {
                String low = matcher.group(1);
                String high = matcher.group(2);
                if (StringUtils.hasText(low)) {
                    if (low.contains(".")) low = new Double(low).toString();
                    else low = new Integer(low).toString();
                }

                if (StringUtils.hasText(high)) {
                    if (high.contains(".")) high = new Double(high).toString();
                    else high = new Integer(high).toString();
                }

                if (StringUtils.hasText(low) && StringUtils.hasText(high)) {
                    refRangeMap.put("low", low);
                    refRangeMap.put("high", high);
                }
            }
        }
        catch (IllegalStateException | IndexOutOfBoundsException | NumberFormatException e){
            LOG.warn("An error occurred while parsing lab reference range.", e);
        }

        return refRangeMap;
    }



    private String getSummary(LabResult oLab) {
        String summary = null;
        if (oLab.getTestName() != null) {
            summary = oLab.getTestName();
        }

        return summary;
    }

    private String getStatusCode(String resultStatus) {

        return "urn:va:lab-status:" + getStatusName(resultStatus);
    }

    private String getStatusName(String resultStatus) {
        String status = "completed";

        if (resultStatus != null) {
            status = resultStatus;

        }

        return status;
    }

    private String getCategoryCode(String labType) {
        String categoryCode = null;

        if (labType != null) {
            categoryCode = "urn:va:lab-category:" + labType;
        }

        return categoryCode;
    }

    private String getLabType(String accession) {
        String labType = null;
        int pos = 0;

        if (accession != null) {
            pos = accession.indexOf('^', -1);
            if (pos >= 0) {
                labType = accession.substring(pos+1).trim();
            }
        }

        return labType;
    }

    private String getLabCategoryName(String labType)
    {
        if(labType != null)
        {
            if(labType.equals("CH"))
                return "Laboratory";
            else if(labType.equals("AP"))
                return "Pathology";
        }


        return "";
    }


    /**
     * Create a UID from the given values.
     *
     * @param sDomain The domain of the data to be stored.
     * @param sSystemId The Site iD
     * @param sEdipi The patient EDIPI
     * @param sEventId The DoD record event ID
     * @return
     */
    private String createUid(String sDomain, String sSystemId, String sEdipi, String sEventId) {
        return "urn:va:" + sDomain + ":" + sSystemId + ":" + sEdipi + ":" + sEventId;
    }
}
