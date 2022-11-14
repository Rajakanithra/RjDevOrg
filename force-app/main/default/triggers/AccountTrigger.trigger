trigger AccountTrigger on Account (before insert)
{
if (Org_Specific_Setting__mdt.getInstance('Run_All_Triggers')?.Value__c == true) 
{
        TriggerHandler handler = new AccountTriggerHandler(Trigger.isExecuting, Trigger.size);
        switch on Trigger.operationType
        {
            when BEFORE_INSERT 
            {
                // handler.beforeInsert(Trigger.new);
            }
        }
}
}