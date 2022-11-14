trigger OpportunityTriggerTrainingRohit on Opportunity(Before Update) {
    if(Trigger.isBefore && Trigger.isUpdate){
        //OpportunityTriggerTaining.opportunityAmountIncrement(Trigger.newMap);
        OpportunityTriggerTaining.opportunityAmountIncrement(Trigger.Old,Trigger.newMap);
        //
    }
}