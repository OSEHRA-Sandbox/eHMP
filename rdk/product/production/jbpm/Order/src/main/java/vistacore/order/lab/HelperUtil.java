package vistacore.order.lab;
import java.util.Map;
/**
 * This class was automatically generated by the data modeler tool.
 */

public class HelperUtil implements java.io.Serializable {

    static final long serialVersionUID = 1L;
    private static final Map<String, String> statusCodeMap;
    static {
        Map<String, String> tempMap = new java.util.HashMap<String, String>();
	tempMap.put("urn:va:order-status:dc", "Discontinued");
        tempMap.put("urn:va:order-status:comp", "Complete");
        tempMap.put("urn:va:order-status:hold", "Hold");
        tempMap.put("urn:va:order-status:flag", "Flagged");
        tempMap.put("urn:va:order-status:pend", "Pending");
        tempMap.put("urn:va:order-status:actv", "Active");
        tempMap.put("urn:va:order-status:exp", "Expired");
        tempMap.put("urn:va:order-status:schd", "Scheduled");
        tempMap.put("urn:va:order-status:part", "Partial Results");
        tempMap.put("urn:va:order-status:dlay", "Delayed");
        tempMap.put("urn:va:order-status:unr", "Unreleased");
        tempMap.put("urn:va:order-status:dc/e", "Discontinued/Edit");
        tempMap.put("urn:va:order-status:canc", "Canceled");
        tempMap.put("urn:va:order-status:laps", "Lapsed");
        tempMap.put("urn:va:order-status:rnew", "Renewed");
        tempMap.put("urn:va:order-status:none", "No Status");        
	statusCodeMap = java.util.Collections.unmodifiableMap(tempMap);
    }

    public HelperUtil() {
    }

   public static boolean isValidStatusCode(String statusCode) {
	if (statusCode == null) {
		return false;	
	}
	if (statusCode.equals("urn:va:order-status:actv") ||
	statusCode.equals("urn:va:order-status:pend") ||
	statusCode.equals("urn:va:order-status:unr") ||
	statusCode.equals("urn:va:order-status:canc") ||
	statusCode.equals("urn:va:order-status:comp") ||
	statusCode.equals("urn:va:order-status:dc") ||
	statusCode.equals("urn:va:order-status:exp") ||
	statusCode.equals("urn:va:order-status:laps") ||
	statusCode.equals("urn:va:order-status:part") ||
	statusCode.equals("urn:va:order-status:schd")) {
		return true;
	}

	return false; 
   }
   
   public static String transformStatusCode(String statusCode) {
	if (statusCode == null) {
		return "";	
	}
	
	if (statusCodeMap.containsKey(statusCode)) {
		return "Status : " + statusCodeMap.get(statusCode);
	}

	return "Status : Unknown (" + statusCode + ")";	
   }
}