public class animalApi {
    public static void apiCallOut()
    {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        system.debug('responseValue--->'+response);
        system.debug('getStatusCode--->'+response.getStatusCode());
        if (response.getStatusCode() == 200) 
        {
            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            system.debug('Deserialize the JSON string--->'+results);
            List<Object> animals = (List<Object>) results.get('animals');
            System.debug('Received the following animals:');
            for (Object animal: animals) 
            {
                System.debug(animal);
            }
        }
    }
    
}