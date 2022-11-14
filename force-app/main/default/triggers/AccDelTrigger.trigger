trigger AccDelTrigger on Account (after update) {
    if(Trigger.isBefore && Trigger.isDelete){
        //AccountTriggerTraining.accountDoNotDeleteIfOpportunityExist(trigger.old);
       // AccountTriggerTraining.restrictForDelete(trigger.old);
        //AccountTriggerTraining.restrictForDelete1(trigger.old);
        //AccountTriggerTraining.accountDoNotDeleteIfContactsExist(trigger.old);
    }
    
     //AccountTriggerTraining.listOfContactsNameInAccount(trigger.new);   
 //AccountTriggerTraining.ListOfOpportunitiesInAccount(trigger.new);   
    }