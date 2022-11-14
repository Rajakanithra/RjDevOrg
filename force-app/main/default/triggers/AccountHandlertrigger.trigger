trigger AccountHandlertrigger on Account (before insert,before update,after insert, after update) 
{
    Trigger_context__c tc = Trigger_context__c.getValues('AccountHandlertrigger');
    if(tc.Execute_Trigger__c==TRUE){
     //AbstractClassAccount.run('Account', Trigger.operationType , Trigger.new, Trigger.old, Trigger.newMap, Trigger.oldMap);   
    }
    
//AbstractClassAccount.run('Account', Trigger.operationType , Trigger.new, Trigger.old, Trigger.newMap, Trigger.oldMap);
}