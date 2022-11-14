trigger RecordOwnerNameToFieldTrigger on Account (before insert) {
    if(Trigger.isBefore && Trigger.isInsert){
        RecordOwnerNameToField.main(Trigger.new);
    }
}