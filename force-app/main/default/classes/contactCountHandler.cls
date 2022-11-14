public class contactCountHandler
{
/*public static void ContactCountMethod(List<Contact> triggernew)
  {
      set<id>ids=new set<id>();
      
      List<Account>acclist=new List<Account>();
      
      for(Contact co:triggernew)
      {
          if(co.AccountId != Null)
          {
              ids.add(co.AccountId);
          }
          
      }
      
      
      for(Account ac:[select id,Number_of_contacts__c,(select id from contacts) from Account where id in:ids])
      {
          if(ac.id != NULL)
          {
              ac.Number_of_contacts__c= string.ValueOf(ac.Contacts.size());
              system.debug('---------->'+ac.Number_of_contacts__c);
              acclist.add(ac);
          }
 
      }
        update acclist;

}*/
    public static void Agecalculation(List<Contact> triggernew)
    {
        for(Contact co:triggernew)
        {
            if(co.Birthdate !=null)
            {
                co.Age__c=system.Today().Year()-co.Birthdate.Year();
            }
        }
    }
    /*public static void Agecalculation(List<Contact> triggernew)
    {
        List<Account>acclist=new List<Account>();
        set<id>ids=new  set<id>();
        integer Age;
        for(Contact co:triggernew)
        {
            if(co.AccountId != Null && co.birthDate!=Null)
            {
                ids.add(co.AccountId);
                Age=system.Today().Year()-co.Birthdate.Year();
            }
        }
        for(Account acc:[select id,ContactAge__c from Account where id in:ids])
        {
            acc.ContactAge__c=Age;
            acclist.add(acc);
        }
        update acclist;
    }*/
    public static void AverageAgecalculation(List<Contact> triggernew)
    {
        List<Account>accl=new List<Account>();
        set<id>ids=new set<id>();
        Decimal avgage;
        for(Contact co:triggernew)
        {
            if(co.AccountId!=null && co.Age__c != null)
            {
                
                ids.add(co.AccountId);
            }
        }
        for(AggregateResult ar:[select AccountId,AVG(Age__c)tot from Contact where AccountId in:ids GROUP BY AccountId])
        {
            avgage=(Decimal)ar.get('tot');
        }
        for(Account acc:[select ContactAvgAge__c from Account where id in:ids])
        {
            acc.ContactAvgAge__c= avgage;
            accl.add(acc);
        }
        update accl;
    }
    public static void contactCountNew(List<Contact>triggernew){
        List<Account>acclist = new List<Account>();
        Set<Id>Ids = new Set<Id>();
        for(Contact cc:triggernew){
            if(cc.Accountid !=null){
                Ids.add(cc.AccountId);
            }
        }
        List<Account> accNew = [select id,Number_of_contacts__c,(select id from Contacts) from Account where id in:Ids];
        for(Account acc:accNew){
            if(accNew != null){
                acc.Number_of_contacts__c = string.valueOf(acc.Contacts.size());
                acclist.add(acc);
            }
        }
        update acclist;
    }
   public static void latestContactTrue(List<Contact> triggerNew)
    {
        List<Contact> conObj = new List<Contact>();
        set<id> ids = new set<id>();
        for(Contact con: triggerNew)
        {
            if(con.accountId != null)
            {
                ids.add(con.accountId); 
            }
        }
        if(!ids.isEmpty())
        {
            Map<id,Contact> conList = new Map<id,Contact>([select id, name,accountId, IsLatest__c from contact where accountId in: ids AND IsLatest__c = true AND Id NOT in: triggerNew]);
            if(conList.size() > 0)
            {
                for(Contact con : conList.values())
                {
                        con.IsLatest__c = false;
                        conObj.add(con);
               }
            }
            system.debug('oldRecords---------->'+conList);
            system.debug('newRecords---------->'+triggerNew);
        }
        Update conObj;
    }



  }