@RestResource(urlMapping='/Accounts')
global class AccountVisitAPISFHost {
    @HttpPost
    global static ContactResponse createAccountVisit(List<MainClass> data){
        system.debug('Data:'+data);
        // system.debug('Visits:'+visits);
        List<Account> accList = new List<Account>();
        List<Visit__c> visitList = new List<Visit__c>();
        for(MainClass acc: data){
            Account accs = new Account();
            system.debug('Data is:'+data);
            system.debug('Data is:'+acc);
            accs.Name = acc.accountName;
            accs.Phone = acc.phone; 
            accList.add(accs);
            
        }
        insert accList;
        integer count = 0;
        for(MainClass acc: data){
            
            system.debug('Acc is:'+acc);
            system.debug('Count :'+count);
            List<classOne> visits = acc.visits;
            if(visits != null){
                for(classOne co : visits){
                    system.debug('CO is:'+co);
                    Visit__c vs = new Visit__c();
                    vs.Name = co.name;
                    vs.Visit_Date__c = co.visitDate;
                    vs.Customer__c = accList.get(count).Id;
                    visitList.add(vs);
                }
            }
        }
        insert visitList;
        
        
        try{
            system.debug('AccList is:'+accList);
            ContactResponse cr = new ContactResponse();
            List<Id> ids = new List<Id>();
            for(Account acc : accList){
                ids.add(acc.id);
            }
            cr.id = ids;
            return cr;
        }
        catch(Exception ex){
            ContactResponse cr = new ContactResponse();
            cr.error = ex.getMessage();
            return cr;
        }
        
    }
    global class MainClass{
        global string accountName;
        global string phone;
        global List<classOne> visits;
    }
    global class classOne{
        global date visitDate;
        global string name;
    }
    global class ContactResponse{
        global List<Id> id;
        global string error;
    }
    global class finalClass{
        global List<MainClass> data;
    }
    public class AccountApiException extends Exception{
        
    }
}