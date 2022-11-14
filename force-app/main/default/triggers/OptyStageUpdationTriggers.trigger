trigger OptyStageUpdationTriggers on Opportunity (before insert,before update) {
if(Trigger.isBefore && Trigger.isInsert) {
        // then update the initial value of Amount to 0.
        List<Opportunity> newopty = new List<Opportunity>();
        for(Opportunity opty : trigger.new) {
            opty.Amount = 0;    
        }
    }
    /*(Trigger.isBefore && Trigger.isUpdate){
        for(Opportunity opty : trigger.new){
            if(opty.StageName == 'Qualification'){
                opty.Amount = opty.Amount + 1000;
            }
            else if(opty.StageName == 'Needs analysis'){
                opty.Amount = opty.Amount +1000;
            }
           else if(opty.CloseDate == system.today())
            {
                opty.Amount = 1000;
            }
        }
    }*/
    
    
   /* // For Update a single record
    if(Trigger.isBefore && Trigger.isUpdate){
        List<Opportunity> newOpportunities = trigger.new;
        //List<Opportunity> oldOpportunities = trigger.old;
        system.debug('new Opportunities'+newOpportunities);
        //system.debug('old Opportunities'+oldOpportunities);
        for(Opportunity op: newOpportunities)
        {
          Opportunity oldOpportunities = Trigger.oldMap.get(op.id);
          if(op.stageName != oldOpportunities.stageName)
          {
            op.Amount = op.Amount + 1000; 
          }
        }
    }*/
    /*if(Trigger.isBefore && Trigger.isUpdate) {
        // Only be executed when something is updated
        List<Opportunity> oldOpportunities = Trigger.old;
        List<Opportunity> newOpportunities = Trigger.new;
        System.debug('newOpportunities :' + newOpportunities);
        System.debug('oldOpportunities :' + oldOpportunities);
        Opportunity oldOpp = oldOpportunities.get(0); 
        Opportunity newOpp = newOpportunities.get(0);
        if(oldOpp.StageName != newOpp.StageName) {
            System.debug('stagename has changed from ' + oldOpp.StageName + ' to ' + newOpp.StageName);
            System.debug('opty amount is :' + newOpp.Amount);
            newOpp.Amount = oldOpp.Amount + 1000;
        }
    }
    System.debug('final opty is :' + Trigger.new.get(0));*/

    if(Trigger.isBefore && Trigger.isUpdate){
        List<Opportunity> newOpportunities = Trigger.new;
        //List<Opportunity> oldOpportunities = Trigger.old;
        System.debug('newOpportunities :' + newOpportunities);
        //System.debug('oldOpportunities :' + oldOpportunities);
        
        for(Opportunity newopp : newOpportunities){
            Opportunity oldopp = Trigger.oldMap.get(newopp.Id); 
            System.debug('stage name changed from'+ oldopp.StageName + ' to ' + newopp.StageName);
            if(newopp.StageName != oldopp.StageName){
               newopp.Amount = oldopp.Amount + 1000; 
                System.debug('Opty Amount is :'+newopp.Amount);
            }
        }
    }
}