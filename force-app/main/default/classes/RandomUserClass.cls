public class RandomUserClass {
 public static  List<Contact> conList = new List<Contact>();
Public static void createListOfContacts(){
    
    for(integer i=0;i<10;i++){
      Http h = new Http();
        
        HttpRequest req = new HttpRequest();
        req.setMethod('GET');
        req.setEndpoint('https://randomuser.me/api/');
        
        HttpResponse res = h.send(req);
        System.debug('res :' + res);
        
        Integer statusCode = res.getStatusCode();
        System.debug('statusCode :' + statusCode);
        
        String body = res.getBody();
        System.debug('body :' + body);
        
        topLevel ress = (topLevel)system.JSON.deserialize(body,topLevel.class);
        System.debug('Contactsrecord :'+ ress);
       string gender,first,last,title,phone,city,state,country;
        for(PersonalDetails re :ress.results){
            gender = re.gender;
            first = re.name.first;
            last = re.name.last;
            title = re.name.title;
            phone = re.phone;
            city = re.location.city;
            state = re.location.state;
            country = re.location.country;
        }
        addContacts(gender,title,first,last,phone,city,state,country);
        
       
    }
    Insert conList;
}        
    public static void addContacts(string gender,string title,string first,string last,string city,string state,string country,string phone){
      Contact con = new Contact();
       
        con.FirstName = first;
        con.gender__c = gender;
        con.Title = title;
        con.LastName = last;
        con.MailingCity = city;
        con.MailingState = state;
        con.MailingCountry = country;
        con.Phone = phone;
        conList.add(con);
      
   
    }
  


    public class topLevel{
        public List<PersonalDetails> results;
        //public List<name> name;
    }
    public class PersonalDetails{
        public String gender;
        public nameDetails name;
         
        public locationDetails location;
        //public streetDetails street;
        public String phone;
    }
    public class nameDetails{
        public String title;
        public String first;
        public String last;
    }
    public class locationDetails{
        //public List<streetDetails> streets;
        public streetDetails street;
        public string city;
         public string state;
         public string country;
        }
    public class streetDetails{
            public integer numbers;
            public string name;
        }
    
}