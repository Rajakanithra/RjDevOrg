public class OpportunityHandlerClass
{
public static void LastopportunityclosedDate(List<Opportunity> triggernew)
{
    List<Account>acclist=new List<Account>();
    set<id>ids=new set<id>();
    for(Opportunity opp:triggernew)
    {
        if(opp.AccountId != Null)
        {
            ids.add(opp.AccountId);
        }
    }
    List<Opportunity>oppty=[select id,CloseDate from Opportunity where AccountId in:ids order by CloseDate DESC limit 1];
    for(Account acc:[select id,Last_Opportunity_Closedate__c from Account where id in:ids])
    {
        acc.Last_Opportunity_Closedate__c = string.ValueOf(oppty[0].CloseDate);
        acclist.add(acc);
    }
    Update acclist;
}
    public static void opportunitynextstep(List<Opportunity> triggernew)
    {
        set<id>ids=new set<id>();
        //List<Account>accl=new List<Account>();
        for(Opportunity op:triggernew)
        {
            if(op.AccountId != null)
            {
                ids.add(op.AccountId);
            }
        }
        List<Account> acc=new List<Account>([select id,Name,Rating from Account where id in:ids]);
        
            for(opportunity op:triggernew)
            {
                op.NextStep=acc[0].Rating;
                
            }
        
    }
    public static void sumofopportunityamount(List<Opportunity> triggernew)
    {
        
        set<id>ids = new set<id>();
        List<Account>acclist = new List<Account>();
        decimal overallcost;
        for(Opportunity op:triggernew)
        {
            if(Op.AccountId != Null)
            {
                ids.add(op.AccountId);
            }
        }
        for(AggregateResult ar : [select  AccountId, SUM(Amount)tot from Opportunity where AccountId in:ids GROUP BY AccountId])
        {
            overallcost=(decimal)ar.get('tot');
          	system.debug('OverAll Cost---->'+(Decimal) ar.get('tot'));  
        }
        
        for(Account acc: [select id, Overall_Opportunity_Cost__c from Account where id in:ids])
            
        {
            acc.Overall_Opportunity_Cost__c = overallcost;
            acclist.add(acc);
            //system.debug('------------->'+overallcost);
        }

        update acclist;
    }
    
    public  static void totalopportunitycount(List<Opportunity>triggernew)
    {
        set<id>ids=new set<id>();
        List<Account>acclist=new List<Account>();
        integer count;
        for(Opportunity op:triggernew)
        {
            if(op.AccountId != Null)
            {
                ids.add(op.AccountId);
            }
        }
        for(AggregateResult ar:[select AccountId, COUNT(id)tot from Opportunity where AccountId in:ids group by AccountId])
            
        {
            count=(integer)ar.get('tot');
            system.debug('---------->'+count);
        }
        for(Account acc:[select id,Total_Opportunity_Count__c from Account where id in:ids])
        {
            acc.Total_Opportunity_Count__c= string.ValueOf(count);
            acclist.add(acc);
        }
        update acclist;
    }
    public static void totalOpportunityAmount(List<Opportunity> triggernew){
        List<Account> accountList = new List<Account>();
        Set<Id> AccountIds = new Set<Id>();
        for(Opportunity opty : triggernew){
            if(opty.AccountId != null){
                AccountIds.add(opty.AccountId);
                system.debug('AccountIds:'+AccountIds);
            }
        }
        AggregateResult result = [select AccountId,SUM(OpportunityAmount__c)tot,COUNT(id)ct 
                                  from Opportunity 
                                  where AccountId In : accountIds 
                                  Group by AccountId];
        system.debug('Aggregate Result is:'+result);
        for(Account accList :[select Id,Name,TotalOpportunityAmount__c,NumberOfOpportunityCount__c from Account where id In : AccountIds]){
            accList.TotalOpportunityAmount__c = (decimal) result.get('tot');
            accList.NumberOfOpportunityCount__c = (integer) result.get('ct');
            accountList.add(accList);
        }
        update accountList;
    }
}