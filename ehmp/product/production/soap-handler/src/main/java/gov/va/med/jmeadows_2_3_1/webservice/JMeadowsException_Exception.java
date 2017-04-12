
package gov.va.med.jmeadows_2_3_1.webservice;

import javax.xml.ws.WebFault;


/**
 * This class was generated by the JAX-WS RI.
 * JAX-WS RI 2.2.5-b01 
 * Generated source version: 2.1
 * 
 */
@WebFault(name = "JMeadowsException", targetNamespace = "http://webservice.jmeadows.med.DNS   /")
public class JMeadowsException_Exception
    extends Exception
{

    /**
     * Java type that goes as soapenv:Fault detail element.
     * 
     */
    private JMeadowsException faultInfo;

    /**
     * 
     * @param faultInfo
     * @param message
     */
    public JMeadowsException_Exception(String message, JMeadowsException faultInfo) {
        super(message);
        this.faultInfo = faultInfo;
    }

    /**
     * 
     * @param faultInfo
     * @param cause
     * @param message
     */
    public JMeadowsException_Exception(String message, JMeadowsException faultInfo, Throwable cause) {
        super(message, cause);
        this.faultInfo = faultInfo;
    }

    /**
     * 
     * @return
     *     returns fault bean: gov.va.med.jmeadows_2_3_1.webservice.JMeadowsException
     */
    public JMeadowsException getFaultInfo() {
        return faultInfo;
    }

}