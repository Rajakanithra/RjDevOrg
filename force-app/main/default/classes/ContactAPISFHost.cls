@RestResource(urlMapping='/contacts')
global class ContactAPISFHost {
@HttpGet
    global static List<Contact> getContactByFirstNameAndLastName(){
        RestRequest req = RestContext.request;
        RestResponse resp = RestContext.response;
        string requestURL = req.requestURI;
        system.debug('RequestURL:'+requestURL);
        system.debug('RequestParams:'+req.params);
        system.debug('RequestHeaders:'+req.headers);
        Map<string,string> param = req.params;
        for(string key : param.keySet()){
            system.debug('Key:'+ key + ':::Value:'+ param.get(key));
        }
        string firstName = param.get('fname');
        string lastName = param.get('lname');
        if(string.isBlank(firstName) || string.isBlank(lastName)){
            resp.statusCode = 400;
            throw new ContactApiException('FirstName and LastName are Mandatory URL Param');
        }
        return [select id,FirstName,LastName from Contact where FirstName =: firstName AND LastName =: lastName limit 10];
    }
    
    @HttpPost
    global static ContactResponse createContact(List<NameClass> data,addressDetails address){
        system.debug('Data is:'+data);
        List<Contact> conList = new List<Contact>();
        Contact con = new Contact();
        for(NameClass cs : data){
            
            con.FirstName = cs.firstName;
            con.LastName = cs.lastName;
            con.Email = cs.email;
        }
            con.MailingStreet = address.streetName;
            con.MailingCity = address.city;
            con.MailingPostalCode = address.postcode;
            conList.add(con);
        
     
        try{
            insert conList;
            ContactResponse cr = new ContactResponse();
            List<Id>ids = new List<Id>();
            for(Contact cc : conList){
                ids.add(cc.id);
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
    global class ContactResponse{
        global List<id> id;
        global string error;
    }
    global class addressDetails{
        global string streetName;
        global string city;
        global string postcode;
    }
    global class NameClass{
        global string firstName;
         global string lastName;
         global string email;
    }
    global class MainClass{
        global List<NameClass> data;
        global addressDetails address;
    }
    public class ContactApiException extends Exception{
        
    }
    
}