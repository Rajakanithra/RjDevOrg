public class VisitBatch implements Database.Batchable<sObject>{
    
    /* public Database.QueryLocator start(Database.BatchableContext bc){
system.debug('In start method');
return Database.getQueryLocator('SELECT id,Name FROM Visit__c'); 
//return Database.getQueryLocator('select id,Name,Visit_Date__c,Customer__c from Visit__c');
}
public void execute(database.BatchableContext bc,List<Visit__c>vlist){
system.debug('In execute method the batch size is:'+vlist.size());
for(Visit__c vs:vlist){
vs.Amount__c=500;

}

update vlist;
}
public void finish(database.BatchableContext bc){
system.debug('In finish Method');
}*/
    /*public Database.QueryLocator start(Database.BatchableContext bc){

return Database.getQueryLocator('select id from Account');
}
public void execute(Database.BatchableContext bc, List<Account>accList){
List<Visit__c> visits = [select id,Visit_Date__c,Customer__c from Visit__c where Customer__c IN :accList order by Visit_Date__c desc,Customer__c desc];
Set<Id>ids = new Set<Id>();
List<Visit__c>deleteList = new List<Visit__c>();
for(Visit__c vv : visits){
if(ids.Contains(vv.Customer__c)){
deleteList.add(vv);
}
else
{
ids.add(vv.Customer__c);
}
}
delete deleteList;

}
public void finish(Database.BatchableContext bc){

}*/
    /*Set<Id> latestVisit = new Set<Id>();
public Database.QueryLocator start(Database.BatchableContext bc){
return Database.getQueryLocator('SELECT id,CreatedDate FROM Account');  
}
public void execute(Database.BatchableContext bc, List<Account>accList){
List<Visit__c>deleteVisit = new List<Visit__c>();
Set<Id>AccountIds = new Set<Id>();
for(Account acc : accList){

AccountIds.add(acc.Id); 


}

for(Visit__c visits : [SELECT id,Visit_Date__c,Customer__c FROM Visit__c WHERE Customer__c IN : AccountIds ORDER BY Visit_Date__c DESC]){
if(latestVisit.contains(visits.Customer__c)){
deleteVisit.add(visits);
}
else{
latestVisit.add(visits.Customer__c);
}
}
if(!deleteVisit.isEmpty()){
delete deleteVisit; 
}
}

public void finish(Database.BatchableContext bc){

}*/
    /*public Database.QueryLocator start(Database.BatchableContext bc){
        system.debug('In Start Method');
        return Database.getQueryLocator('SELECT id,Visit_Date__c,Customer__c FROM Visit__c');  
    }
    public void execute(Database.BatchableContext bc,List<Visit__c>visitList){
        system.debug('In Execute method:'+visitList.size());
        Set<Id>AccountIds = new Set<Id>();
        for(Visit__c vis : visitList){
               AccountIds.add(vis.Customer__c);  
          
        }
        List<Visit__c>vList = [SELECT id,Visit_Date__c,Customer__c FROM Visit__c WHERE Customer__c IN : AccountIds ORDER BY Visit_Date__c DESC,CreatedDate DESC Limit 5000];
        Map<string,Visit__c>LatestVisit = new Map<string,Visit__c>();
        //set<String>LatestVisit = new set<String>();
        List<Visit__c>deleteVisit = new List<Visit__c>();
        for(Visit__c visits : vList){
            string key=visits.Customer__c +':'+ visits.Visit_Date__c;
            if(LatestVisit.containskey(key)){
                deleteVisit.add(visits);
            }
            /*string key=visits.Customer__c +':'+ visits.Visit_Date__c;
            if(LatestVisit.contains(key)){
                deletevisit.add(visits);
            }
            else
            {
                LatestVisit.put(key,visits);
                //LatestVisit.add(visits.Id);
            }
        }
           delete deleteVisit; 
     
    }
    public void finish(Database.BatchableContext bc){
     system.debug('In finish Method');   
    }*/
    public Database.QueryLocator start(Database.BatchableContext bc){
        system.debug('In Start Method');
        return Database.getQueryLocator('SELECT id,Visit_Date__c,Customer__c FROM Visit__c');  
    }
    public void execute(Database.BatchableContext bc,List<Visit__c>visitList){
        system.debug('In Execute method:'+visitList.size());
        Set<Id>AccountIds = new Set<Id>();
        for(Visit__c vis : visitList){
               AccountIds.add(vis.Customer__c);  
          
        }
        List<Visit__c>vList = [SELECT id,Visit_Date__c,Customer__c FROM Visit__c WHERE Customer__c IN : AccountIds ORDER BY Visit_Date__c DESC,CreatedDate DESC Limit 5000];
        
        Set<String>LatestVisit = new Set<String>();
        List<Visit__c>deleteVisit = new List<Visit__c>();
        for(Visit__c visits : vList){
            
            string key = visits.Customer__c +':'+ visits.Visit_Date__c;
            if(LatestVisit.contains(key)){
                deletevisit.add(visits);
            }
            else
            {
                
                LatestVisit.add(key);
            }
        }
           delete deleteVisit; 
     
    }
    public void finish(Database.BatchableContext bc){
     system.debug('In finish Method');   
    }
}