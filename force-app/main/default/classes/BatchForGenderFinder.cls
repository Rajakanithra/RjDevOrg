public class BatchForGenderFinder implements Database.Batchable <sObject>,Database.AllowsCallouts {
    public Database.QueryLocator Start(Database.BatchableContext bc){
        system.debug('The Start Method');
     return Database.getQueryLocator('select id,Name,gender__c from Contact Where FirstName != null and Gender__c = Null Limit 50');   
    }
    public void Execute(Database.BatchableContext bc,List<Contact> conList){
        system.debug('In Execute method:');
        List<Id> conIds = new List<Id>();
        for(Contact con : conList){
            conIds.add(con.id);
        }
        ContactApiCallout.contactApiMethodMultipleRecords(conIds);
    }
    public void Finish(Database.BatchableContext bc){
        system.debug('In Finish Method:');
    }
}