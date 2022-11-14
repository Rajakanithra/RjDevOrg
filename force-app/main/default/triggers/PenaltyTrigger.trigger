trigger PenaltyTrigger on Penalty__c (before insert,before update)
{
if(trigger.isBefore)
{
    if(trigger.isInsert||trigger.isUpdate)
    {
        //penaltyHandlerClassnew.penaltyHandlerMethod(trigger.new);
    }
}
}