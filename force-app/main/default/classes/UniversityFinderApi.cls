public class UniversityFinderApi {
    public static void universityFinderApiMethod(){
        Http h = new Http();
        
        HttpRequest req = new HttpRequest();
        req.setMethod('GET');
        req.setEndpoint('http://universities.hipolabs.com/search?country=United+States');
        
        HttpResponse res = h.send(req);
        System.debug('res :' + res);
        
        Integer statusCode = res.getStatusCode();
        System.debug('statusCode :' + statusCode);
        
        String body = res.getBody();
        System.debug('body :' + body);
        List<classOne> result = (List<classOne>)system.JSON.deserialize(body, List<classOne>.class);
        system.debug('The Result is:'+result);
    }
    
    
    public class classOne{
        public List<string> domains;
        public List<string> web_pages;
        public string alpha_two_code;
        public string country;
        public string name;
    }
    
    
    
}