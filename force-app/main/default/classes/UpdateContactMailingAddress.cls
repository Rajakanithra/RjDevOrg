public class UpdateContactMailingAddress implements Database.Batchable<sObject>
{
public integer recordCount=0;
    public Database.QueryLocator start(Database.BatchableContext bc)
    {
    return Database.getQueryLocator('select id,BillingStreet,BillingCity,BillingState,BillingPostalCode,'
                                   +'(select id,MailingStreet,MailingCity,MailingState,MailingPostalCode from Contacts)'+'from Account');    
    }
    public void execute(Database.BatchableContext bc,List<Account>acclist)
    {
      List<Contact>conlist=new List<Contact>();
        for(Account acc:acclist)
        {
           
            for(Contact con:acc.Contacts)
            {
              con.MailingStreet=acc.BillingStreet;
                con.MailingCity=acc.BillingCity;
                con.MailingState=acc.BillingState;
                con.MailingPostalCode=acc.BillingPostalCode;
                conlist.add(con);
                recordCount++;
            }  
        }
        update conlist;
    }
    public void finish(Database.BatchableContext bc)
    {
       system.debug('---Record Count----'+recordCount);
    }
}