@RESTResource(urlMapping='/createLead/')
global class CreateLeadClass {
@HTTPPost
    global static String createLeadRecord(){
        String fname,lname,comp;
        String fieldName,fieldValue;
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        String JsonBody = req.requestBody.toString();
        JSONParser Parser = JSON.createParser(JsonBody);
        while(Parser.nextToken()!=Null){
            if(Parser.getCurrentToken()!=JSONToken.END_OBJECT){
                fieldName = Parser.getCurrentName();
                fieldValue = Parser.getText();
                if(fieldName == 'FirstName'){
                    fname = fieldValue;
                }
                else if(fieldName == 'LastName'){
                    lname = fieldValue;
                }
                else if(fieldName == 'Company'){
                    comp = fieldValue;
                }
            }
        }
        Lead l = new Lead(firstName=fname,lastName=lname,Company=comp);
        insert l;
        return l.Id;
    }
}