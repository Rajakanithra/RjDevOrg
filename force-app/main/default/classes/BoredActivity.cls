public class BoredActivity {
    public static void boredActivityMethod(){
        Http h = new Http();
        HttpRequest req = new HttpRequest();
        req.setMethod('GET');
        req.setEndpoint('https://www.boredapi.com/api/activity');
        
        HttpResponse res = h.send(req);
        system.debug('Response:'+res);
        integer statusCode = res.getStatusCode();
        system.debug('StatusCode:'+statusCode);
        string body = res.getBody();
        system.debug('the body:'+body);
        BoredActivityInner bai = (BoredActivityInner)JSON.deserialize(body,BoredActivityInner.class);
        system.debug('boredActivity-->'+bai);
        storeBoredActivity(bai);
        
    }
    public static void storeBoredActivity(BoredActivityInner bar){
        BoredActivity__c ba = new BoredActivity__c();
        ba.Activity__c = bar.activity;
        ba.Type__c = bar.types;
        ba.Participants__c = bar.participants;
        ba.Price__c = bar.price;
        ba.Link__c = bar.link;
        ba.Key__c = bar.key;
        ba.Accessibilty__c = bar.access;
        insert ba;
       }
    public class BoredActivityInner{
        public string activity;
        public string types;
        public decimal participants;
        public decimal price;
        public string link;
        public string key;
        public decimal access;
    }
}