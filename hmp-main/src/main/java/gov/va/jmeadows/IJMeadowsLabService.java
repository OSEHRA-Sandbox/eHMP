package gov.va.jmeadows;

import gov.va.cpe.idn.PatientIds;
import gov.va.cpe.vpr.sync.vista.VistaDataChunk;
import gov.va.med.jmeadows.webservice.JMeadowsException_Exception;
import gov.va.med.jmeadows.webservice.JMeadowsQuery;

import java.util.List;

public interface IJMeadowsLabService {


    /**
     * Retrieve the chem lab data and format it into a VistaChunk to be included into the set of data returned to the system.
     *
     * @param query JMeadows query bean.
     * @param patientIds Patient identifier bean.
     * @return The VistaDataChunk list that contains the lab data.
     * @throws JMeadowsException_Exception If a serious error occurs.
     * @throws IllegalArgumentException if required parameters are missing or invalid.
     */
    public List<VistaDataChunk> fetchDodPatientChemistryLabs(JMeadowsQuery query, PatientIds patientIds) throws JMeadowsException_Exception;


    /**
     * Retrieve the anatomic pathology lab data and format it into a VistaChunk to be included into the set of data returned to the system.
     *
     * @param query JMeadows query bean.
     * @param patientIds Patient identifier bean.
     * @return The VistaDataChunk list that contains the lab data.
     * @throws JMeadowsException_Exception If a serious error occurs.
     * @throws IllegalArgumentException if required parameters are missing or invalid.
     */
    public List<VistaDataChunk> fetchDodPatientAnatomicPathologyLabs(JMeadowsQuery query, PatientIds patientIds) throws JMeadowsException_Exception;

}
