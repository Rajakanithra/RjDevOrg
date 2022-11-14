public class AccountTriggerClass {
public static void AccountTriggerMethod(List<Account> triggernew)
{
    Id emea = Schema.SObjectType.Account.getRecordTypeInfosByName().get('EMEA').getRecordTypeId();
    Id apac = Schema.SObjectType.Account.getRecordTypeInfosByName().get('APAC').getRecordTypeId();
    
    for(Account acc:triggernew)
    {
        if(acc.RecordTypeId==emea)
        {
            acc.Reason__c='Europe';
        }
        else if(acc.RecordTypeId==apac)
        {
            acc.Reason__c='Asia';
        }
    }
    
}
    public static void ContactCreation(List<Account>triggernew)
    {
       List<Contact>conlist=new List<Contact>(); 
       for(Account acc:triggernew)
       {
           Contact con=new Contact();
           con.LastName = acc.Name;
           con.AccountId=acc.Id;
           conlist.add(con);
           System.debug('----------->'+con.Name);
                  }
        insert conlist;
    }
}