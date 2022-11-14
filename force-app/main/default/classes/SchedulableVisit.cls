global class SchedulableVisit implements schedulable {
    global void execute(SchedulableContext sc){
        List<Visit__c>visitList = [SELECT id,Visit_Date__c,Visit_Type__c FROM Visit__c WHERE Visit_Type__c = null];
        For(Visit__c vs : visitList){
            
                vs.Visit_Type__c = 'New';
            
        }
        update visitList;
    }
}