package vistacore.order.discharge;

/**
 * This class was automatically generated by the data modeler tool.
 */

public class Movement implements java.io.Serializable
{

   static final long serialVersionUID = 1L;

   private java.lang.String dateTime;
   private java.lang.String localId;
   private java.lang.String movementType;
   private java.lang.String movementSubType;
   private java.lang.String transferFacilityCode;
   private java.lang.String transferFacilityName;
   private java.lang.String summary;

   public Movement()
   {
   }

   public java.lang.String getDateTime()
   {
      return this.dateTime;
   }

   public void setDateTime(java.lang.String dateTime)
   {
      this.dateTime = dateTime;
   }

   public java.lang.String getLocalId()
   {
      return this.localId;
   }

   public void setLocalId(java.lang.String localId)
   {
      this.localId = localId;
   }

   public java.lang.String getMovementType()
   {
      return this.movementType;
   }

   public void setMovementType(java.lang.String movementType)
   {
      this.movementType = movementType;
   }

   public java.lang.String getMovementSubType()
   {
      return this.movementSubType;
   }

   public void setMovementSubType(java.lang.String movementSubType)
   {
      this.movementSubType = movementSubType;
   }

   public java.lang.String getTransferFacilityCode()
   {
      return this.transferFacilityCode;
   }

   public void setTransferFacilityCode(java.lang.String transferFacilityCode)
   {
      this.transferFacilityCode = transferFacilityCode;
   }

   public java.lang.String getTransferFacilityName()
   {
      return this.transferFacilityName;
   }

   public void setTransferFacilityName(java.lang.String transferFacilityName)
   {
      this.transferFacilityName = transferFacilityName;
   }

   public java.lang.String getSummary()
   {
      return this.summary;
   }

   public void setSummary(java.lang.String summary)
   {
      this.summary = summary;
   }

   public Movement(java.lang.String dateTime, java.lang.String localId,
         java.lang.String movementType, java.lang.String movementSubType,
         java.lang.String transferFacilityCode,
         java.lang.String transferFacilityName, java.lang.String summary)
   {
      this.dateTime = dateTime;
      this.localId = localId;
      this.movementType = movementType;
      this.movementSubType = movementSubType;
      this.transferFacilityCode = transferFacilityCode;
      this.transferFacilityName = transferFacilityName;
      this.summary = summary;
   }

}