@RESTResource(urlMapping='/createStudent/')
global class StudentApi {
@HTTPPost
    global static string createStudentRecord(){
        String sname,email,aadhar;
        //decimal aadhar;
        String fieldName,fieldValue;
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        String JsonBody = req.requestBody.toString();
        JSONParser Parser = JSON.createParser(JsonBody);
        while(Parser.nextToken()!=Null){
            if(Parser.getCurrentToken()!=JSONToken.END_OBJECT){
                fieldName = Parser.getCurrentName();
                fieldValue = Parser.getText();
                if(fieldName == 'Name'){
                    sname = fieldValue;
                }
                if(fieldName == 'Email__c'){
                    email = fieldValue;
                }
                if(fieldName == 'Aadhar_Number__c'){
                    aadhar = fieldValue;
                }
    
}
        }
        StudentObj__c so = new StudentObj__c(Name=sname,Email__c=email,Aadhar_Number__c =decimal.valueOf(aadhar));
        insert so;
		return so.Id;
    }
}