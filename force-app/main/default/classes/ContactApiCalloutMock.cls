public class ContactApiCalloutMock implements HttpCalloutMock  {
    public Boolean isError=false;
    public integer noOfCallouts =0;
    public HttpResponse respond(HttpRequest req) {
        system.debug('Reuest:'+req);
        system.debug('Request Body:'+req.getBody());
        noOfCallouts++;
        HttpResponse resp = new HttpResponse();
        if(isError){
            resp.setStatus('Fail');
            resp.setStatusCode(400);
            resp.setBody('{"error":"something is wrong"}');
        }
        else{
            resp.setStatus('Pass');
            resp.setStatusCode(200);
            resp.setBody('{"count":8919,"gender":"male","name":"raja","probability":0.73}');
        }
        return resp;
    }
}