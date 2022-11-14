trigger OptyStageUpdationTrigger on Opportunity (before insert,before update) {
    if(trigger.isBefore && trigger.isInsert){
        OpptStageUpdateClass.opptyStatusUpdateMethod(trigger.new);
    }
    if(trigger.isBefore && trigger.isUpdate){
        OpptStageUpdateClass.opptyStatusUpdateMethod(trigger.new);
    }
}