public class ContactApiCallout {
    /*@future (callout=true)
    public static void contactApiMethod(List<Id>conId){
        List<String>firstNameList = New List<String>();
        List<Contact> firstName =[select id,FirstName from Contact where id IN:conId];
        for(Contact con:firstName){
            firstNameList.add(con.FirstName);
        }
        for(string str:firstNameList){
            
            
            Http h = new Http();
            HttpRequest req = new HttpRequest();
            req.setMethod('GET');
            req.setEndpoint('https://api.genderize.io/?name='+str);
            
            HttpResponse res = h.send(req);
            system.debug('Response:'+res);
            system.debug('Response:'+res.getStatusCode());
            string body = res.getBody();
            system.debug('Response Body:'+body);
            ContactInner CI = (ContactInner)JSON.deserialize(body, ContactInner.class);
            UpdateContact(conid,CI.gender);
            
        }
    }
    public static void UpdateContact(List<Id>conid, string gender){
        List<Contact>cont =[select id,gender__c from Contact where id IN : conid];
        for(Contact cn:cont){
            cn.gender__c = gender;
        }
        update cont;
    }
    
    public class ContactInner{
        
        public string gender;
        
        
    }*/
    /*@future (callout=true)
    public static void contactApiMethodNultipleRecords(List<Id>contactIds){
        // Fetching the first Name from the list of records using SOQL and stored in a variable.
        List<Contact> contacts =[select id,FirstName,LastName,gender__c from Contact where id IN:contactIds];
        // Iterating the API callouts when multiple records are there.
        for(Contact tempcontacts : contacts){
            // Making the API callouts.
            Http h = new Http();
            HttpRequest req = new HttpRequest();
            req.setMethod('GET');
            req.setEndpoint('https://api.genderize.io/?name='+tempcontacts.FirstName);
            
            HttpResponse res = h.send(req);
            //system.debug('Response:'+res);
            //system.debug('Response:'+res.getStatusCode());
            //string body = res.getBody();
            //system.debug('Response Body:'+body);
            
            //Fetching the Gender from the body and convert into the objects.
            Gender gen = (Gender)JSON.deserialize(res.getBody(), Gender.class);
            tempcontacts.gender__c = gen.gender;
            
        }
        // DML statements for updating the List of Records.
        update contacts;
    }
    
    
    public class Gender{
        
        public string gender;
        
        
    }*/
   /* @future (callout=true)
    public static void contactApiMethodMultipleRecords(List<Id>contactIds){
        // Fetching the first Name from the list of records using SOQL and stored in a variable.
        List<Contact> contacts =[select id,FirstName,LastName,gender__c from Contact where id IN:contactIds];
        Map<String,Contact>contactMap = new Map<String,Contact>();
        List<Contact> contactList = new List<Contact>();
        String gender;
        // Iterating the API callouts when multiple records are there.
        for(Contact contactVar : contacts){
            contactMap.put(contactVar.FirstName,contactVar);
        }
        for(String str : contactMap.KeySet()){
            Http h = new Http();
            
            HttpRequest req = new HttpRequest();
            req.setEndpoint('https://api.genderize.io/?name='+str);
            req.setMethod('GET');
            
            HttpResponse res = h.send(req);   
            System.debug('response :' + res);
            
            String body = res.getBody();
            System.debug('body :' + body);
            
            
            Gender gen = (Gender) JSON.deserialize(body, Gender.class);
            System.debug('ContactClass : ' + gen);
            gender = gen.gender;
            System.debug('gender : '+gender);
            
        }
        //List<Contact> contList =[select id,FirstName,LastName,gender__c from Contact where id IN:contactIds];
        //System.debug('contList :'+ contList);
        for(Contact cons : contacts){
            
            cons.gender__c = gender;
            contactList.add(cons);
            System.debug('cons : '+cons);
        }
            
        update contactList;
        System.debug('conList :'+contactList);
     
        // DML statements for updating the List of Records.
        
}
    

    
    public class Gender{
        
        public string gender;
        
        
    }*/
    
   /* @future (callout=true)
    public static void contactApiMethodNultipleRecords(List<Id>contactIds)
    {
        
        //Map<String,List<Contact>> contactMap = new Map<string,List<Contact>>();
        Set<Id> ids = new Set<Id>();
        ids.addAll(contactIds);
        List<Contact> contacts =[select id,FirstName,LastName,gender__c from Contact where id IN:contactIds];
        Set<Contact> idsnew = new Set<Contact>();
        idsnew.addAll(contacts);
        Set<Contact> duplicateSet = new Set<Contact>();
        for(Contact c1 : contacts){
            for(Contact c2 :idsnew){
                if(c1.FirstName == c2.FirstName){
                    duplicateSet.add(c1);
                }
                else{
                    Http h = new Http();
                    HttpRequest req = new HttpRequest();
                    req.setMethod('GET');
                    req.setEndpoint('https://api.genderize.io/?name='+c1);
                    
                    HttpResponse res = h.send(req);
                    system.debug('Response:'+res);
                    system.debug('Response:'+res.getStatusCode());
                    string body = res.getBody();
                    system.debug('Response Body:'+body);
                    Gender gen = (Gender)JSON.deserialize(res.getBody(), Gender.class);
                    c1.gender__c = gen.gender;
                    
                }
                update contacts; 
            }
        }
    }
    
    public class Gender{
        
        public string gender;
        
    }*/
    
    /*@future(callout=true)
    public static void findAndSaveCountryCodeForMultipleContacts(List<Id> contactIds){
        // 1. Fetch the name
        List<Contact> contacts = [SELECT Id, FirstName,Country_Code__c FROM Contact WHERE Id IN :contactIds];
        Map<String, String> firstNameToCountryMap = new Map<String, String>();
        // First, It check if the Map contains Previous FirstName value as same
        // Then The relevant value of firstname is assigned to Country_Code__c;
        // Then Update the gender.
        // If the First Name is new then it will call API.
        // Then Find the highest value probability and update the relevant country code. 
        for(Contact loopContactVariable : contacts) {
            if(firstNameToCountryMap.containsKey(loopContactVariable.FirstName)) {
                loopContactVariable.Country_Code__c = firstNameToCountryMap.get(loopContactVariable.FirstName);
            } else {
                // 2. Invoke the api for fetching the country code.
                Http h = new Http();
                HttpRequest req = new HttpRequest();
                req.setMethod('GET');
                req.setEndpoint('https://api.nationalize.io/?name=' + loopContactVariable.FirstName);
                
                HttpResponse resp = h.send(req);
                system.debug('Response :'+resp);
                
                String body = resp.getBody();
                system.debug('Response Body :'+body);
                
                CountryCode code = (CountryCode) JSON.deserialize(body, CountryCode.class);
                system.debug('Country Code :'+code);
                List<CountryProbability> countryProbList = code.country;
                decimal maxValue;
                String CountryId;
                for(CountryProbability countryProb : countryProbList){
                    if(maxValue == NULL){
                        maxValue = countryProb.probability;
                        CountryId = countryProb.country_id;
                    }
                    else if(countryProb.probability > maxValue){
                        maxValue = countryProb.probability;
                        CountryId = countryProb.country_id;
                    }
                }
                system.debug('Highest Value:'+maxValue);
                system.debug('Country Code:'+CountryId);
                // 3. Save the Country code on the contact
                loopContactVariable.Country_Code__c = CountryId;
                firstNameToCountryMap.put(loopContactVariable.FirstName,loopContactVariable.Country_Code__c);
             }
        }
        
        // 4. DML statement as a single DML instead of being in for loop for updating the contact records.
        
        update contacts;
        System.debug('final update :' + contacts);
    }
    public class CountryCode{
        
        public List<CountryProbability>country;
        public string name;
   
    }
    public class CountryProbability{
        public string country_id;
        public decimal probability;
    }*/
    /*@future(callout=true)
    public static void findAndSaveCountryForSingleContact(Id contactId){
        // 1. Fetch the name
        Contact conList = [SELECT Id, FirstName,Country_Code__c FROM Contact WHERE Id = :contactId LIMIT 1];
        
        // 2. Invoke the api for fetching the gender
        Http h = new Http();
        HttpRequest req = new HttpRequest();
        req.setMethod('GET');
        req.setEndpoint('https://api.nationalize.io/?name=' + conList.FirstName);
        
        HttpResponse resp = h.send(req);
        system.debug('Response:'+resp);
        
        String body = resp.getBody();
        system.debug('Body:'+body);
        
        code cont = (code) JSON.deserialize(body, code.class);
        system.debug('Countrycode:'+cont);
        List<CountryProbability> cc = cont.country;
        system.debug('CountryProbability:'+cc.size());
        decimal maxValue=0;
        String CountId;
        for(CountryProbability cp : cc){
           system.debug('Country Probability:'+cp); 
                if(cp.probability > maxValue){
                    maxValue = cp.probability;
                    CountId = cp.country_id;
                
            }
            system.debug('MaxValue:'+maxValue);
            system.debug('coId'+ CountId);
            
          }
       
//         3. Save the gender on the contact
         conList.Country_Code__c = CountId;
        update conList;
        system.debug('ConList:'+conList);
    }
    public class code{
        
        public List<CountryProbability>country;
        public string name;
   
    }
    public class CountryProbability{
        public string country_id;
        public decimal probability;
    }*/
   @future(callout=true)
    public static void findAndSaveGenderForSingleContact(Id contactId){
        // 1. Fetch the name
        Contact con = [SELECT Id, FirstName, gender__c FROM Contact WHERE Id = :contactId LIMIT 1];
        
        // 2. Invoke the api for fetching the gender
        Http h = new Http();
        HttpRequest req = new HttpRequest();
        req.setMethod('GET');
        req.setEndpoint('https://api.genderize.io/?name=' + con.FirstName);
        
        HttpResponse resp = h.send(req);
        Gender gen = (Gender) JSON.deserialize(resp.getBody(), Gender.class);
        
        // 3. Save the gender on the contact
        con.gender__c = gen.gender;
        update con;
    }
    @future(callout=true)
    public static void findAndSaveGenderForMultipleContacts(List<Id> contactIds){
        // 1. Fetch the name
        List<Contact> contacts = [SELECT Id, FirstName, gender__c FROM Contact WHERE Id IN :contactIds];
        Map<String, String> firstNameToGenderMap = new Map<String, String>();
        
        for(Contact loopContactVariable : contacts) {
            if(firstNameToGenderMap.containsKey(loopContactVariable.FirstName)) {
                loopContactVariable.gender__c = firstNameToGenderMap.get(loopContactVariable.FirstName);
            } else {
                // 2. Invoke the api for fetching the gender
                Http h = new Http();
                HttpRequest req = new HttpRequest();
                req.setMethod('GET');
                req.setEndpoint('https://api.genderize.io/?name=' + loopContactVariable.FirstName);
                
                HttpResponse resp = h.send(req);
                Gender gen = (Gender) JSON.deserialize(resp.getBody(), Gender.class);
                
                // 3. Save the gender on the contact
                loopContactVariable.gender__c = gen.gender;
                firstNameToGenderMap.put(loopContactVariable.FirstName, gen.gender);
            }
        }
        
        // 4. DML statement as a single DML instead of being in for loop
        System.debug('final update :' + contacts);
        update contacts;
    }
    public class Gender{
        
        public string gender;
        
        
    }
}