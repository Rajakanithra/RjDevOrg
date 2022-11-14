public class StudentOperationsController {
    @AuraEnabled
    public static void addStudent(StudentWrapper student) {
        Student__c stud = new Student__c();
        stud.Name = student.name;
        if(student.marksList != NULL) {
            for(Marks marks : student.marksList) {
                if(marks.subject != NULL &&
                   marks.subject.equalsIgnoreCase('English')) {
                       stud.English__c = marks.mark;
                   }
                if(marks.subject != NULL &&
                   marks.subject.equalsIgnoreCase('Maths')) {
                       stud.Maths__c = marks.mark;
                   }
                if(marks.subject != NULL &&
                   marks.subject.equalsIgnoreCase('Language')) {
                       stud.Language__c = marks.mark;
                   }
                if(marks.subject != NULL &&
                   marks.subject.equalsIgnoreCase('Science')) {
                       stud.Science__c = marks.mark;
                   }
                if(marks.subject != NULL &&
                   marks.subject.equalsIgnoreCase('Maths')) {
                       stud.Maths__c = marks.mark;
                   }
            }
        }
        insert stud;
    }
    
    /*@AuraEnabled
public static void addStudents(List<StudentWrapper> studentWrappers) {
List<Student__c>stud1 = new List<Student__c>();
if(!studentWrappers.isEmpty())
{
system.debug('38th Line---->StudentWrappers------------>'+studentWrappers);
for(StudentWrapper stu: StudentWrappers)
{
if(stu.Name != null && !stu.marksList.isEmpty())
{
system.debug('43th Line---->Name------------>'+stu.name);
Student__c stud = new Student__c() ;
stud.Name = stu.name;
system.debug('46th Line---->Marks------------>'+stu.marksList);
for(Marks mar: stu.marksList)
{
if(mar.subject.equalsIgnoreCase('English'))
{
stud.English__c = mar.mark;
}
if(mar.subject.equalsIgnoreCase('Language'))
{
stud.Language__c = mar.mark;
}
if(mar.subject.equalsIgnoreCase('Maths'))
{
stud.Maths__c = mar.mark;
}
if(mar.subject.equalsIgnoreCase('Science'))
{
stud.Science__c = mar.mark;
}
if(mar.subject.equalsIgnoreCase('Social Science'))
{
stud.Social_Science__c = mar.mark;
}

stud1.add(stud);
}
}

}
}
insert stud1; 
}*/
    
    private static Student__c getStudentFromWrapper(StudentWrapper wrapper){
        Student__c stud = new Student__c();
        stud.Name = wrapper.name;
        system.debug('@@@@@@Line 82 @@@@@@'+wrapper);
        system.debug('@@@@@@Line 83 @@@@@@'+wrapper.marksList);
        if(wrapper.marksList != NULL) {
            for(Marks marks : wrapper.marksList) {
                if(marks.subject != NULL &&
                   marks.subject.equalsIgnoreCase('English')) {
                       stud.English__c = marks.mark;
                   }
                if(marks.subject != NULL &&
                   marks.subject.equalsIgnoreCase('Maths')) {
                       stud.Maths__c = marks.mark;
                   }
                if(marks.subject != NULL &&
                   marks.subject.equalsIgnoreCase('Language')) {
                       stud.Language__c = marks.mark;
                   }
                if(marks.subject != NULL &&
                   marks.subject.equalsIgnoreCase('Science')) {
                       stud.Science__c = marks.mark;
                   }
                if(marks.subject != NULL &&
                   marks.subject.equalsIgnoreCase('Maths')) {
                       stud.Maths__c = marks.mark;
                   }
            }
        }
        return stud;
    }
    @AuraEnabled
    public static void addStudents(List<StudentWrapper> studentWrappers){
        List<Student__c>stdlist = new List<Student__c>();
        for(StudentWrapper wrapper : studentWrappers){
            stdlist.add(getStudentFromWrapper(wrapper));
        }
        insert stdlist;
    }
    @AuraEnabled
    public static void updateMarks(String Name, List<Marks> mar)
    {
        List<Student__c> stdUpd = new List<Student__c>();
        set<id> ids = new set<id>();
        if(!String.isBlank(Name))
        {
            for(Student__c st: [select id, name from Student__c where name =: Name])
            {
                ids.add(st.id);  
            }
            
            Student__c studs = [select id, name, English__c, Language__c, Social_Science__c, Science__c from Student__c where id in: ids];
            
            for(Marks marks : mar) {
                
                if(marks.subject != NULL &&
                   marks.subject.equalsIgnoreCase('English')) {
                       studs.English__c = marks.mark;
                   }
                if(marks.subject != NULL &&
                   marks.subject.equalsIgnoreCase('Maths')) {
                       studs.Maths__c = marks.mark;
                   }
                if(marks.subject != NULL &&
                   marks.subject.equalsIgnoreCase('Language')) {
                       studs.Language__c = marks.mark;
                   }
                if(marks.subject != NULL &&
                   marks.subject.equalsIgnoreCase('Science')) {
                       studs.Science__c = marks.mark;
                   }
                if(marks.subject != NULL &&
                   marks.subject.equalsIgnoreCase('Social Science')) {
                       studs.Social_Science__c = marks.mark;
                   }
            }
            stdUpd.add(studs);
        }
        update stdUpd;
    }
    @AuraEnabled
    public static void deleteStudent(String Name)
    {
        List<Student__c> stdDel = new List<Student__c>();
        set<id> ids = new set<id>();
        if(!String.isBlank(Name))
        {
            Student__c st = [select id, name from Student__c where name =: Name];
            ids.add(st.id);  
            Student__c studs = [select id, name, English__c, Language__c, Social_Science__c, Science__c from Student__c where id in: ids limit 1];
            stdDel.add(studs);
        }
        delete stdDel;
    }
    @AuraEnabled
    public static void deleteMarksForStudent(String Name)
    {
        List<Student__c> markDel = new List<Student__c>();
        for(Student__c stu: [select English__c, Language__c, Social_Science__c, Science__c,Maths__c from Student__c where name =: Name limit 1])
        {
            stu.English__c = null;
            stu.Language__c = null;
            stu.Science__c = null;
            stu.Social_Science__c = null;
            stu.Maths__c = null;
            markDel.add(stu);
        }
        update markDel;
    }
    /*public static void updateMarksonBulk(Map<string, List<Marks>> marksMap)
{
List<Student__c> markDel = new List<Student__c>();
Student__c stu = [select English__c, Language__c, Social_Science__c, Science__c,Maths__c from Student__c where name =: marksMap.keySet()];
for(Marks mar: marksMap.values())
{

}
}*/
    public static void updateTotalForStudents(List<String> name)
    {
        Decimal tot;
        List<Student__c> stdList = new List<Student__c>();
        Student__c stu = [select Total_Mark__c,English__c, Language__c, Social_Science__c, Science__c,Maths__c from Student__c where name =: name];
        tot = stu.English__c + stu.Language__c + stu.Maths__c + stu.Science__c + stu.Social_Science__c;
        stu.Total_Mark__c = tot;
        stdList.add(stu);
        update stdList;
    }
    
    
    public Class Marks {
        public String subject {get;set;}
        public Integer mark {get;set;}
        public Marks(String sub,integer mrk){
            this.subject=sub;
            this.mark=mrk;
        }
    }
    
    public Class StudentWrapper {
        @AuraEnabled
        public String name {get;set;}
        @AuraEnabled
        public List<Marks> marksList {get;set;}
        
        public StudentWrapper(String nameParam, List<Marks> marksListParam) {
            this.name = nameParam;
            this.marksList=marksListParam;
            if(marksList == NULL) {
                marksList = new List<Marks>();
            }
            else {
                this.marksList = marksListParam;
            }
        }
        
        
    }
    
}