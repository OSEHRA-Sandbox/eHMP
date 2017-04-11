package vistacore.order.consult;

/**
 * This class was automatically generated by the data modeler tool.
 */

public class Orderable implements java.io.Serializable
{

   static final long serialVersionUID = 1L;

   private java.lang.String uid;
   private java.lang.String name;
   private java.lang.String type;
   private java.lang.String state;
   private java.lang.String facilityEnterprise;
   private java.lang.String domain;
   private java.lang.String subDomain;
   private vistacore.order.consult.OrderableData data;

   public Orderable()
   {
   }

   public java.lang.String getUid()
   {
      return this.uid;
   }

   public void setUid(java.lang.String uid)
   {
      this.uid = uid;
   }

   public java.lang.String getName()
   {
      return this.name;
   }

   public void setName(java.lang.String name)
   {
      this.name = name;
   }

   public java.lang.String getType()
   {
      return this.type;
   }

   public void setType(java.lang.String type)
   {
      this.type = type;
   }

   public java.lang.String getState()
   {
      return this.state;
   }

   public void setState(java.lang.String state)
   {
      this.state = state;
   }

   public java.lang.String getFacilityEnterprise()
   {
      return this.facilityEnterprise;
   }

   public void setFacilityEnterprise(java.lang.String facilityEnterprise)
   {
      this.facilityEnterprise = facilityEnterprise;
   }

   public java.lang.String getDomain()
   {
      return this.domain;
   }

   public void setDomain(java.lang.String domain)
   {
      this.domain = domain;
   }

   public java.lang.String getSubDomain()
   {
      return this.subDomain;
   }

   public void setSubDomain(java.lang.String subDomain)
   {
      this.subDomain = subDomain;
   }

   public vistacore.order.consult.OrderableData getData()
   {
      return this.data;
   }

   public void setData(vistacore.order.consult.OrderableData data)
   {
      this.data = data;
   }

   public Orderable(java.lang.String uid, java.lang.String name,
         java.lang.String type, java.lang.String state,
         java.lang.String facilityEnterprise, java.lang.String domain,
         java.lang.String subDomain,
         vistacore.order.consult.OrderableData data)
   {
      this.uid = uid;
      this.name = name;
      this.type = type;
      this.state = state;
      this.facilityEnterprise = facilityEnterprise;
      this.domain = domain;
      this.subDomain = subDomain;
      this.data = data;
   }

}