public with sharing class StudentPageController {
    public StudentObj__c newStudentObject {get;set;}
    public ParentObj__c motherRecord {get;set;}
    public ParentObj__c fatherRecord {get;set;}
    public Decimal motherAdhaarNumber {get;set;}
    public Decimal fatherAdhaarNumber {get;set;}
    public String motherOccupation {get;set;}
    public String fatherOccupation {get;set;}
    public Boolean bothParentsAdharNumberWrong {get;set;}
    public Boolean fatherInformationMissing {get;set;}
    public Boolean motherInformationMissing  {get;set;}
    
    public StudentPageController(ApexPages.StandardController controller) {
        intVariables();
        newStudentObject.Name = '';
        newStudentObject.Aadhar_number__c = 0;
        newStudentObject.Mother_Aadhar_Number__c = 0;
        newStudentObject.Father_Aadhar_number__c = 0;
        newStudentObject.Discount_Requested__c = 0;
    }
    
    private void intVariables() {
        bothParentsAdharNumberWrong = false;
        
        fatherInformationMissing = false;
        motherInformationMissing = false;
        newStudentObject = new 	StudentObj__c();
        
    }
    
    public PageReference saveRecord() {
        try {
            Boolean isDataValid = isDataValidForDiscount();
            System.debug('Parent Adhaar Error value'+bothParentsAdharNumberWrong);
            if(isDataValid) {
                insert newStudentObject;
            }
            else {
                if(bothParentsAdharNumberWrong) {
                    ApexPages.addmessage(new ApexPages.message(ApexPages.severity.Error,  'Adhaar Info of Parents not matching '+newStudentObject.Name));  
                } 
                if(motherInformationMissing) {
                    ApexPages.addmessage(new ApexPages.message(ApexPages.severity.Error, 'Mother Information Incorrect'+newStudentObject.Name));  
                }
                if(fatherInformationMissing) {
                    ApexPages.addmessage(new ApexPages.message(ApexPages.severity.Error, 'Father Information Incorrect'+newStudentObject.Name));  
                }
                
            }
            
        }catch(Exception e) {
            System.debug('The Exception is at Stack Trace'+e.getStackTraceString());
            System.debug('The Exception is at Line Number'+e.getLineNumber());
            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.Error, e.getMessage(), 'Error Saving the Record @Saravana...please check'));  
        }
        return NULL; 
    }
    
    private Boolean isDataValidForDiscount() {
        motherAdhaarNumber = newStudentObject.Mother_Aadhar_Number__c;
        fatherAdhaarNumber = newStudentObject.Father_Aadhar_number__c;
        
        System.debug('motherAdhaarNumber --> '+motherAdhaarNumber);
        System.debug('fatherAdhaarNumber --> '+fatherAdhaarNumber);
        
        
        List<ParentObj__c> parentRecords = [select Id , 
                                            Aadhar_Number__c, 
                                            Name, 
                                            Job_Sector__c,
                                            Relationship__c
                                            from ParentObj__c 
                                            where Aadhar_Number__c 
                                            IN (:motherAdhaarNumber, :fatherAdhaarNumber)];
        
        System.debug('Parent Records  --> '+parentRecords);
        if(parentRecords.size() == 0) {
            bothParentsAdharNumberWrong = true;
            return false;
            
        }
        for(ParentObj__c parent : parentRecords) {
            if(parent.Relationship__c.equalsIgnoreCase('Father')) {
                this.fatherRecord = parent;
            }
            if(parent.Relationship__c.equalsIgnoreCase('Mother')) {
                this.motherRecord = parent;
            }
        }
        System.debug('this.fatherRecord --> '+this.fatherRecord);
        System.debug('this.motherRecord --> '+this.fatherRecord);
        
        if(fatherRecord==NULL){
            fatherInformationMissing = true;
            return false;
        }
        
        if(motherRecord==NULL){
            motherInformationMissing = true;
            return false;
        }
        
        this.fatherOccupation = fatherRecord.Job_Sector__c;
        this.motherOccupation = motherRecord.Job_Sector__c;
        
        //Condition 1 - If Father Job is Govt, Mother Job is Govt maximum Discount = 5%
        
        System.debug('this.fatherOccupation --> '+this.fatherOccupation);
        System.debug('this.motherOccupation --> '+this.motherOccupation);
        System.debug('this.newStudentObject --> '+this.newStudentObject);
        System.debug('this.newStudentObject.Discount_Requested__c --> '+this.newStudentObject.Discount_Requested__c);
        
        if(this.fatherOccupation.equalsIgnoreCase('Govt') && 
           this.motherOccupation.equalsIgnoreCase('Govt') &&
           this.newStudentObject.Discount_Requested__c > 5)  {
               return false;
           }
        
        //Condition 2 - If Father Job is Govt, Mother Job is Private  maximum Discount = 10%
        
        
        
        if(this.fatherOccupation.equalsIgnoreCase('Govt') && 
           this.motherOccupation.equalsIgnoreCase('Private') &&
           this.newStudentObject.Discount_Requested__c > 10)  {
               return false;
           }
        
        //Condition 3 - If Father Job is Private, Mother Job is Private maximum Discount = 30%
        
        
        
        if(this.fatherOccupation.equalsIgnoreCase('Private') && 
           this.motherOccupation.equalsIgnoreCase('Private') &&
           this.newStudentObject.Discount_Requested__c > 30)  {
               return false;
           }
        
        
        //Condition 4 - If Father and mother are Unemployed maximum Discount = 80%
        
        
        
        if(this.fatherOccupation.equalsIgnoreCase('Unemployee') && 
           this.motherOccupation.equalsIgnoreCase('Unemployee') &&
           this.newStudentObject.Discount_Requested__c > 80)  {
               return false;
           }
        return true;
    }
}