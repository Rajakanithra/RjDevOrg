trigger OpportunityTrigger on Opportunity (before insert,before update,after insert,after update)
{
if(trigger.isAfter)
{
    if(trigger.isInsert || trigger.isUpdate){
            //OpportunityHandlerClass.LastopportunityclosedDate(trigger.new);
            //OpportunityHandlerClass.opportunitynextstep(trigger.new);
            //OpportunityHandlerClass.sumofopportunityamount(trigger.new);
            //OpportunityHandlerClass.totalopportunitycount(trigger.new);
           // AccountTriggerTraining.listOfOpportunitiesNameInAccount(trigger.new);
    
    OpportunityHandlerClass.totalOpportunityAmount(trigger.new);
        }
}
}