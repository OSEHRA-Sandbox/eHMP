
package gov.va.med.jmeadows_2_3_0.webservice;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Java class for getAdmissionProcedures complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="getAdmissionProcedures">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="queryBean" type="{http://webservice.jmeadows.DNS       /}jMeadowsQuery" minOccurs="0"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "getAdmissionProcedures", propOrder = {
    "queryBean"
})
public class GetAdmissionProcedures {

    protected JMeadowsQuery queryBean;

    /**
     * Gets the value of the queryBean property.
     * 
     * @return
     *     possible object is
     *     {@link JMeadowsQuery }
     *     
     */
    public JMeadowsQuery getQueryBean() {
        return queryBean;
    }

    /**
     * Sets the value of the queryBean property.
     * 
     * @param value
     *     allowed object is
     *     {@link JMeadowsQuery }
     *     
     */
    public void setQueryBean(JMeadowsQuery value) {
        this.queryBean = value;
    }

}
