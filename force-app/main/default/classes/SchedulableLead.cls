global class SchedulableLead implements schedulable {
    global void execute(SchedulableContext sc){
        List<Lead>leadList = [select id,LeadSource from Lead where LeadSource = null];
        for(Lead ld :leadList){
            ld.LeadSource='salesforce';
        }
        update leadList;
    }
}