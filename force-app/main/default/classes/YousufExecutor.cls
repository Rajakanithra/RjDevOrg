public class YousufExecutor {
    public static Map<Integer, Student__c> createStudentRecords() {
        Map<Integer, Student__c> studentsMap = new Map<Integer, Student__c>();
        Student__c stud1 = new Student__C();
        stud1.Age__c =22.5;
        Stud1.Roll_Number__C = 1;
        stud1.FatherName__c = 'Dady1';
        stud1.Name = 'Son1';
        stud1.Language__c = 65;
        stud1.English__C = 70;
        stud1.Maths__c = 80;
        stud1.Science__c = 85;
        stud1.Social_Science__c = 75;
        
        
        Student__c stud2 = new Student__C();
        stud2.Age__c =23.5;
        stud2.Roll_Number__C = 2;
        stud2.FatherName__c = 'Dady2';
        stud2.Name = 'Son2';
        stud2.Language__c = 75;
        stud2.English__C = 60;
        stud2.Maths__c = 90;
        stud2.Science__c = 75;
        stud2.Social_Science__c = 85;
        
        Student__c stud3 = new Student__C();
        stud3.Age__c =24.2;
        stud3.Roll_Number__C = 3;
        stud3.FatherName__c = 'Dady3';
        stud3.Name = 'Son3';
        stud3.Language__c = 55;
        stud3.English__C = 90;
        stud3.Maths__c = 100;
        stud3.Science__c = 85;
        stud3.Social_Science__c = 85;
        
        Student__c stud4 = new Student__C();
        stud4.Age__c =21.2;
        stud4.Roll_Number__C = 4;
        stud4.FatherName__c = 'Dady4';
        stud4.Name = 'Son4';
        stud4.Language__c = 85;
        stud4.English__C = 80;
        stud4.Maths__c = 95;
        stud4.Science__c = 85;
        stud4.Social_Science__c = 88;
        
        studentsMap.put(1,stud1);
        studentsMap.put(2,stud2);
        studentsMap.put(3,stud3);
        studentsMap.put(4,stud4);
        
        return studentsMap;
        
        
    }
    
    public static void AllotClass(Map<Integer, Student__c>sMap) {
        //All Students whose age is less than 24 should be allotted Class X
        //All Students whose age is more than 24 should be allotted Class Y
        Map<Integer,String> AllotMap = new Map<Integer,String>();
        for(Student__c s: sMap.values())
        { 
            if(sMap.values()!=Null){
                if(s.age__c > 24)
                {
                    AllotMap.put(Integer.ValueOf(s.age__c) ,'ClassX');  
                }
                else if(s.age__c < 24)
                {
                    AllotMap.put(Integer.ValueOf(s.age__c) ,'ClassY');  
                }  
            }
            
            
        }
        
        system.debug('IsMap----------->'+AllotMap);
    }
    
    public static void MarkCalculation(Map<Integer, Student__c>sMap){
       Map<Integer, Decimal> markMap = new Map<Integer, Decimal>(); 
        for(Student__c st : sMap.values())
        {
            if(sMap.values() != Null){
                decimal totalmarks = st.Language__c + st.English__C + st.Maths__c + st.Science__c + st.Social_Science__c;
                markMap.put(integer.valueof(st.Roll_Number__C),totalmarks);
                
                        
            }            
            
        }
        System.debug('total mark is ---> '+markMap); 
    }  
    
    public static void printValues(Map<Integer, Student__c>sMap) {
        
        System.debug('Values ---> '+sMap.values());
    }
    
}