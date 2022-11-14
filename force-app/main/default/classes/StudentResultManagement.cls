public with sharing class StudentResultManagement
{
    @AuraEnabled
    public static Student__c createStudentRecord(Student__c newRecord){
        List<Student__c> stuList = new List<Student__c>();
        try{
            if(newRecord != null)
            {
                newRecord.Total_Mark__c = newRecord.Language__c+
                    newRecord.English__c+
                    newRecord.Maths__c+
                    newRecord.Science__c+
                    newRecord.Social_Science__c;
                newRecord.Percentage__c = (newRecord.Language__c+
                                           newRecord.English__c+
                                           newRecord.Maths__c+
                                           newRecord.Science__c+
                                           newRecord.Social_Science__c)/5;
                stuList.add(newRecord); 
                insert stuList;
            }
            
            return newRecord;
        }
        catch (Exception e)
        {
            System.debug(e.getMessage());
        }
        return newRecord;
    }
}