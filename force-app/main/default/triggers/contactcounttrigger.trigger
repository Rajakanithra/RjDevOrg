trigger contactcounttrigger on Contact (before insert, before update,after insert,after  update)

{
/*if(trigger.isBefore)
{
    if(trigger.isInsert|| trigger.isUpdate)
    {
       contactCountHandler.Agecalculation(trigger.new);
    }
}
    if(trigger.isAfter)
    {
        if(trigger.isInsert || trigger.isUpdate)
        {
          contactCountHandler.AverageAgecalculation(trigger.new);

        }
    }*/
    if(Trigger.isAfter){
        if(Trigger.isInsert || Trigger.isUpdate){
		//contactCountHandler.contactCountNew(trigger.new); 
          //AccountTriggerTraining.listOfContactsNameInAccount(trigger.new);
        }
        if(recurssiveTrigger.firstRun == true)
        {
           recurssiveTrigger.firstRun = false;
           contactCountHandler.latestContactTrue(trigger.New);
        }
    }
    if(trigger.isBefore)
    {
        if(trigger.IsUpdate || trigger.isInsert)
        {

        }
    }
  
     
}