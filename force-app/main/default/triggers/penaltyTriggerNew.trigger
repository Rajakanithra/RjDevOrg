trigger penaltyTriggerNew on Penalty__c (before insert,before update) {
if(trigger.isBefore){
    if(trigger.isInsert||trigger.isUpdate){
        penaltyHandlerClassnew.PenaltyHandlerMethod(trigger.new);
    }
}
}