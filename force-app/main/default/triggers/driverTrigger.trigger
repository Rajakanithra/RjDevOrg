trigger driverTrigger on Driver__c (before insert,before update) {
if(trigger.isBefore){
    if(trigger.isInsert||trigger.isUpdate)
    {
        driverClassHandler.DriverMethod(trigger.new);
    }
}
}