public without sharing class StudentServiceController {
    /*@AuraEnabled
    public static Student__c createStudentRecord(Student__c newRecord){
        
        insert newRecord;
        return newRecord;
        
    }*/
    
    @AuraEnabled
    public static List<Student__c>  studentlist(String name, String fathersName,Decimal tamil,Decimal english,Decimal maths,Decimal science,Decimal social) {
        Student__c stud = new Student__c() ;
        List<Student__c> studList = new List<Student__c>();    
        stud.Name = name;
        stud.FatherName__c = fathersName;
        stud.Language__c = tamil;
        stud.English__c = english;
        stud.Maths__c = maths;
        stud.Science__c = science;
        stud.Social_Science__c = social;
        
        stud.Total_Mark__c = stud.Language__c+ stud.English__c+ stud.Maths__c+ stud.Science__c+ stud.Social_Science__c;
        Decimal avg = ( stud.Language__c+ stud.English__c+ stud.Maths__c+ stud.Science__c+ stud.Social_Science__c)/5;
        stud.Percentage__c = avg;
        
        
        if(avg > 75){
            stud.Result_Class__c = 'Distinction';
        }else if (avg >= 60 && avg <= 75){
            stud.Result_Class__c = 'First Class';
        }else if ( avg > 50 && avg <= 60){
            stud.Result_Class__c = 'Second Class';
        }
        else if ( avg > 40 && avg <= 50){
            stud.Result_Class__c = 'Third Class';
        }
        
        if(stud.Language__c >40 && stud.English__c > 40 && stud.Maths__c >40 && stud.Science__c > 40 && stud.Social_Science__c > 40){
            stud.Overall_Result__c = 'Pass'; 
        }
        else{
            stud.Overall_Result__c = 'Fail';
        }
        studList.add(stud);
        try {
            insert studList;
            System.debug('@@@@@@ Student record created @@@@ '+studList);
        }catch(Exception e) {
            return  null;
        }
        return studList;
    }
}