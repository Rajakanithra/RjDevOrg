trigger CaseStatusUpdationTrigger on Case (before insert,before update) {
    if(trigger.isBefore && trigger.isInsert){
        CaseStatusUpdation.caseStatusUpdateMethod(trigger.new);
    }
    if(trigger.isBefore && trigger.isUpdate){
        CaseStatusUpdation.caseStatusUpdateMethod2(trigger.oldMap,trigger.new);
    }
    if(trigger.isBefore && trigger.isUpdate){
        CaseStatusUpdation.caseStatusUpdateMethod3(trigger.old,trigger.new);
    }
}