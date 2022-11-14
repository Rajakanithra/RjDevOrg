public class studentInfoHandler 
{
    @AuraEnabled
public static void studentInfoMethod(Student__c studobj)
{
    
    system.debug('Student__c:'+studobj.Name);
    system.debug('Student__c'+studobj.FatherName__c);
    system.debug('Student__c'+studobj.MotherName__c);
    system.debug('Student__c'+studobj.PhoneNumber__c);
    system.debug('Student__c'+studobj.Department__c);
    system.debug('Student__c'+studobj.Shoe_Design__c);
    insert studobj;
}
    @AuraEnabled
    public static List <String> getPicklistValues(sObject objectVar, String fieldNameVar) {
         System.debug('obj '+objectVar);
        List <String> pList = new list <String>();
       
        //Get the object type of the SObject.
        Schema.sObjectType objType = objectVar.getSObjectType();
 
        //Describe the SObject using its object type.
        Schema.DescribeSObjectResult objDescribe = objType.getDescribe();
 
        //Get a map of fields for the SObject
        Map<String, Schema.SObjectField> fieldMap = objDescribe.fields.getMap();
 
        //Get the list of picklist values for this field.
        List<Schema.PicklistEntry > values = fieldMap.get(fieldNameVar).getDescribe().getPickListValues();
 
        //Add these values to the selectoption list.
        for (Schema.PicklistEntry a: values) {
            pList.add(a.getValue());
        }
        
        system.debug('pList '+pList);
        return pList;
    }
    @AuraEnabled
    public static List<Student__c> retrievestudentinfo()
    {
        return[select Name,FatherName__c,MotherName__c,PhoneNumber__c from Student__c order by createdDate ASC];
    }
    
        
}