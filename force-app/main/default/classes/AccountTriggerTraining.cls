public virtual class AccountTriggerTraining extends TriggerFramework {
    /*public static void accountDoNotDeleteIfOpportunityExist(List<Account>triggerOld){
        
        Map<id,Account> accMap = new Map<id, Account>([select ID, (select ID from Opportunities) from Account where ID in: triggerOld]);
        for(Account acc : triggerOld)
        {
            Account accLst = accMap.get(acc.id);
            if(accLst.opportunities.size() > 0)
            {
                accLst.addError('Account Cannot Be Deleted');
            }
        }
    } 
    public static void restrictForDelete(List<Account>triggerOld){
        Set<Id>accid = new Set<Id>();
        for(Account acc:triggerOld){
            accid.add(acc.Id);
        }
        
        Map<id,Account> acMap = new Map<id,Account>([select id,name,(select id,name from Opportunities) from Account where ID in :accid]);
        for(Account Acc:triggerOld){
            //Account acclist1 =acList.get(Acc.id);
            if(acMap.get(Acc.Id).Opportunities.size() > 0){
                Acc.adderror('Account Can Not Be Deleted when Child Opportunity is there'); 
            }
        }
    }
    /*public static void restrictForDelete1(List<Account>triggerOld)
{
Set<Id>accid = new Set<Id>();
for(Account acc:triggerOld)
{
accid.add(acc.Id);
}

List<Account> acList = new List<Account>([select id,name,(select id,name from Opportunities) from Account where ID in :accid]);
List<Account>accountList = new List<Account>();
for(Account Acc:acList)
{
accountList.add(Acc);
}

if(accountList.Opportunities.size() > 0)
{
accountList[0].addError('Account Can Not Be Deleted when Child Opportunity is there'); 
} 


}
    public static void accountDoNotDeleteIfContactsExist(List<Account>triggerOld){
        Set<id>Ids = new Set<id>();
        for(Account accc:triggerOld){
            if(accc.Id != Null){
                Ids.add(accc.Id);
            }
        
            Map<id,Account> accMap = new Map<id,Account>([select id,Name,(select Id,Name from Contacts)from Account where id IN : Ids]);
            for(Account Acc1:triggerOld){
                if(accMap.get(Acc1.Id).Contacts.size() > 0){
                    Acc1.addError('The Account Cannot Be Deleted If contacts Exist');
                }
            }
        }
    }
    /*public static void listOfContactsNameInAccount(List<Contact>triggernew){
        List<Account> accList = new List<Account>();
        Set<Id>parentId = new Set<Id>();
        for(Contact con:triggernew){
            if(con.AccountId != Null){
                parentId.add(con.AccountId);
            }
        }
        Map<id,Account> newAccMap = new Map<Id,Account>([select id,Name,ListOfContactsName__c from Account where id In :parentId]);
        List<string>str = new List<string>();
        for(Contact con:[select id,Name from Contact where AccountId in:newAccMap.keyset()])
        {
            
            if(con.Name != null){
               str.add(con.name);
            }
        }
        for(Account acc: newAccMap.values())
        {
            if(acc.ListOfContactsName__c == null || acc.ListOfContactsName__c != null)
            {
                acc.ListOfContactsName__c = String.join(str, ',');
                accList.add(acc);
            }
        }
        Update accList;
        
    }*/
    /*public static void listOfContactsNameInAccount(List<Contact>newlist){
        List<Account>accList = new List<Account>();
        Set<Id>parentIds = new Set<Id>();
        for(Contact con:newlist){
            if(con.AccountId != null){
                parentIds.add(con.AccountId);
            }
        }
        Map<Id,Account> newacctMap = new Map<Id,Account>([select id,Name,ListOfContactsName__c from Account where id in : parentIds]);
        List<String>Str = new List<String>();
        for(Contact con:[select id,Name from Contact where id in :newacctMap.keySet()]){
            if(con.Name != null){
                str.add(con.name);
            }
        }
        for(Account acc:newacctMap.Values()){
            if(acc.ListOfContactsName__c != null){
                acc.ListOfContactsName__c = String.join(Str, ',');
                accList.add(acc);
            }
        }
        update accList;
    }
    public static void listOfOpportunitiesNameInAccount(List<Opportunity>newList){
        List<Account>accList = new List<Account>();
        Set<Id>parentIds = new Set<Id>();
        for(Opportunity opp:newList){
            if(opp.AccountId != null){
                parentIds.add(opp.AccountId);
            }
        }
        system.debug('ParentIds:'+parentIds);
        Map<Id,Account> newMap = new Map<Id,Account>([select id,Name,ListOfOpportunities__c from Account where id In :parentIds]);
        List<String> strList = new List<String>();
        for(Opportunity op:[select id,Name from Opportunity where AccountId in:newMap.keySet()]){
            if(op.Name != null){
              strList.add(op.Name);  
            }            
        }
        system.debug('strList:'+strList);
        for(Account acc:newMap.Values()){
            if(acc.ListOfOpportunities__c != Null){
                
            
                acc.ListOfOpportunities__c = String.join(strList, ',');
                accList.add(acc);
            }
        }
        update accList;
    }*/
    protected override void afterUpdate(){
    	System.debug('In Account after update trigger');
        // 1. Find out if account amount has changed
        List<Account> accountsWhoseAmountChanged = new List<Account>();
        for(Account newAcc : (List<Account>) Trigger.new) {
            Account oldAcc = (Account) Trigger.oldMap.get(newAcc.Id);
            if(newAcc.Amount__c != oldAcc.Amount__c) {
                // amount has changed
                accountsWhoseAmountChanged.add(newAcc);
            }
        }
        // 2. Find the cases which are not closed of the accounts from Step 1.
        List<Case> cases = [SELECT Id, Account_Amount__c, AccountId FROM Case WHERE AccountId IN :accountsWhoseAmountChanged AND Status != 'Closed'];
        // 3. Loop through these cases from step 2, and update the 'Account_Amount__c' field
        for(Case cc : cases) {
            String accountId = cc.AccountId;
            Account newAcc = (Account) Trigger.newMap.get(accountId);
            cc.Account_Amount__c = newAcc.Amount__c;
        }
        update cases;
    }
}