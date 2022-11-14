public class AccountHandlerclass {
    public static void BeforInsertUpdate(List<Account> triggernew)
    {
        set<id> ids = new set<id>();
        
        for(Account a: triggerNew)
        {
            if(a.OwnerId != null)
            {
                ids.add(a.OwnerId);
            }
        }
        
        Map<id,User> usMap = new Map<id,User>([select id, name from user where id in: ids]);
        
        for(Account ac: TriggerNew)
        {
            if(!usMap.isEmpty() && ac.Number_of_contacts__c == null)
            {
                ac.Number_of_contacts__c = usMap.get(ac.OwnerId).name;
            }
        }
    }
    
    public static void AfterInsertUpdate(List<Account> triggernew)
    {
        set<id> accIds = new set<id>();
        List<Contact> cList  = New List<Contact>();
        
        for(Account acc: triggerNew)
        {
            if(acc.Rating != null)
            {
                accIds.add(acc.Id);  
            }
            
        }
        
        for(Contact con: [Select id, name, LeadSource,Birthdate from Contact where accountId in: accIds])
        {
            if(con.Birthdate != Date.today())
            {
                con.Birthdate = Date.today();
                cList.add(con);
            }
            
        }
        update cList;  
    }
    public static Map<String, Decimal> buildSummary(List<Account> accList, Map<id,Account> oldMap)
    {
       Map<String,Decimal> summaryResult = new Map<String,Decimal>();
       List<string> indusList = new List<string>();
       for(Account accRec: accList)
       {
           Account oldRec = oldMap.get(accRec.id);
           if(String.isNotBlank(accRec.industry) && accRec.Amount__c != null)
           {
               indusList.add(accRec.industry);
           }
           if(oldRec.Industry != accRec.Industry || oldRec.Amount__c != accRec.Amount__c)
           {
               indusList.add(accRec.industry);
           }
       }
       List<Account> accMap = new List<Account>([select id, name,industry,Amount__c from account where industry in:indusList and Amount__c != null order by createdDate]); 
       Decimal curr = 0.00;
       for(Integer i=0; i<accMap.size(); i++)
       {
          Account acc = accMap[i];
          curr += acc.Amount__c;
          summaryResult.put(acc.Industry, curr);
       }
       System.debug('Result ----------->'+summaryResult);
       return summaryResult;
    }
 }