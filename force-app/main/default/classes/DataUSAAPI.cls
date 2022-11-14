public class DataUSAAPI {
    Public static void findUsaPopulationMethod(){
        List<Population__c> popList = new List<Population__c>();
        for(Integer i=0;i<10;i++){
      
        http h = new http();
        HttpRequest req = new HttpRequest();
        req.setMethod('GET');
        req.setEndpoint('https://datausa.io/api/data?drilldowns=Nation&measures=Population');
        
        httpResponse resp = h.send(req);
        system.debug('Response:'+resp);
        
        integer StatusCode = resp.getStatusCode();
        system.debug('StatusCode:'+StatusCode);
        
        string body = resp.getBody();
        system.debug('Response Body:'+body);
        mainClass mc =(mainClass)JSON.deserialize(body, mainClass.class);
        system.debug('Deserialised Object is:'+mc);
        
        string nation,year;
        integer totalpopulation;
        for(dataDetails dt : mc.data){
            nation = dt.Nation;
            year = dt.Year;
            totalpopulation = dt.Population;
        }
        Population__c pop = new Population__c();
        pop.Name = nation;
        pop.Year__c = year;
        pop.Population__c = totalpopulation;
        popList.add(pop);
    }
        insert popList;
        system.debug('Final Result:'+popList);
    }
    public class mainClass{
        public List<dataDetails> data;
    }
    public class dataDetails{
        
        public string Nation;
        public string Year;
        public integer Population;
        //public string Slug_Nation{get;set;}
        
    }
}