trigger AccountTriggernew on Account (after update)
{
    system.debug('after update:');
   // new AccountTriggerTraining().run();
/*if(trigger.isBefore)
{
    if(trigger.isInsert||trigger.isUpdate)
    {
        AccountTriggerClass.AccountTriggerMethod(trigger.new);
    } 
    
}
    if(trigger.isAfter)
    {
        if(trigger.isInsert)
        {
          AccountTriggerClass.ContactCreation(trigger.new);  
        }
    }*/
       
}