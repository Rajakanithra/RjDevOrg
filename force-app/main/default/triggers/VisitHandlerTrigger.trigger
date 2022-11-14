trigger VisitHandlerTrigger on Visit__c (before insert,before update) {
    /*if(Trigger.isAfter){
        if(Trigger.isInsert || Trigger.isUpdate){
            VisitHandlerClass.recentRecordIsLatestSetToTrue(trigger.new);
            }
    }*/
    if(Trigger.isBefore){
        if(Trigger.isInsert || trigger.isUpdate){
          //VisitHandlerClass.oneVisitPerDay(trigger.new);  
        }
    }
}