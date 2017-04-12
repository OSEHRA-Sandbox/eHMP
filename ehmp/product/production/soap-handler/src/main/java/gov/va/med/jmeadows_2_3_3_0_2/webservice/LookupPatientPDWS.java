
package gov.va.med.jmeadows_2_3_3_0_2.webservice;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Java class for lookupPatientPDWS complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="lookupPatientPDWS">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="queryBean" type="{http://webservice.jmeadows.med.DNS   /}pdwsQueryBean" minOccurs="0"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "lookupPatientPDWS", propOrder = {
    "queryBean"
})
public class LookupPatientPDWS {

    protected PdwsQueryBean queryBean;

    /**
     * Gets the value of the queryBean property.
     * 
     * @return
     *     possible object is
     *     {@link PdwsQueryBean }
     *     
     */
    public PdwsQueryBean getQueryBean() {
        return queryBean;
    }

    /**
     * Sets the value of the queryBean property.
     * 
     * @param value
     *     allowed object is
     *     {@link PdwsQueryBean }
     *     
     */
    public void setQueryBean(PdwsQueryBean value) {
        this.queryBean = value;
    }

}