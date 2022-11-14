@IsTest
public with sharing class CynoStudentAdmissionHandlerTest {
    @IsTest
    static void testDefaultConstructor(){
        CynoStudentAdmissionHandler handler=new CynoStudentAdmissionHandler();
        system.assertEquals(true, handler.studentSet!=null,'msg');
        system.assertEquals(0, handler.studentSet.size(),'msg');
    }
    /*
    @IsTest
    static void testAddStudent(){
     CynoStudentAdmissionHandler handler=new CynoStudentAdmissionHandler();

     CynoStudent saravanStudent=new CynoStudent();
     CynoName stu1Name=new CynoName('saravanan','TS','Virat');
     saravanStudent.nameDetails=stu1Name;

     
     CynoAddress saraPAddress = new CynoAddress('periyarnagar','saravanampatti','kovai','637213','TN','India');
     saravanStudent.permenentAddress=saraPAddress;

     CynoAddress saraCAddress=new CynoAddress('periyarnagar','saravanampatti','kovai','637213','TN','India');
     saravanStudent.currentAddress=saraCAddress;

     CynoParent fDetail=new CynoParent('male','father',100000,'software');
     saravanStudent.fatherDetails=fDetail;
     CynoName fName=new CynoName('raja','manickam','rj');
     saravanStudent.fatherDetails.nameDetails=fName;
     
     
     CynoParent mDetail=new CynoParent('female','mother',200000,'software');
     saravanStudent.motherDetails = mDetail;
     CynoName mName=new CynoName('yoga','sri','rj');
     saravanStudent.motherDetails.nameDetails = mName;

     
     CynoStudent rajaStudent=new CynoStudent();
     CynoName stu2Name=new CynoName('raja','Manickam','RJ');
     rajaStudent.nameDetails=stu2Name;

     
     CynoAddress rajaPAddress = new CynoAddress('kamarajar nagar','police station back','vnr','637505','TN','India');
     rajaStudent.permenentAddress=rajaPAddress;

     CynoAddress rajaCAddress=new CynoAddress('kamarajarnagar','police station back','vnr','637505','TN','India');
     rajaStudent.currentAddress=rajaCAddress;

     CynoParent fDetail1=new CynoParent('Male','Father',300000,'Govt');
     rajaStudent.fatherDetails=fDetail1;
     CynoName fName1=new CynoName('Eswaran','palani','Eswar');
     rajaStudent.fatherDetails.nameDetails=fName1;
     
     
     CynoParent mDetail1=new CynoParent('female','mother',200000,'software');
     rajaStudent.motherDetails = mDetail1;
     CynoName mName1=new CynoName('padma','vathi','padmavathi');
     rajaStudent.motherDetails.nameDetails = mName1;


     CynoStudent kanithraStudent=new CynoStudent();
     CynoName stu3Name=new CynoName('Kanithra','Rajamanickam','Kani');
     kanithraStudent.nameDetails=stu3Name;

     
     CynoAddress kanithraPAddress = new CynoAddress('kamarajar nagar','police station back','vnr','637505','TN','India');
     kanithraStudent.permenentAddress=kanithraPAddress;

     CynoAddress kanithraCAddress=new CynoAddress('kamarajarnagar','police station back','vnr','637505','TN','India');
     kanithraStudent.currentAddress=kanithraCAddress;

     CynoParent fDetail2=new CynoParent('male','father',100000,'software');
     kanithraStudent.fatherDetails=fDetail2;
     CynoName fName2=new CynoName('raja','manickam','rj');
     kanithraStudent.fatherDetails.nameDetails=fName2;
     
     
     CynoParent mDetail2=new CynoParent('female','mother',300000,'software');
     kanithraStudent.motherDetails = mDetail2;
     CynoName mName2=new CynoName('yoga','sri','rj');
     kanithraStudent.motherDetails.nameDetails = mName2;
     
     
    handler.addStudent(saravanStudent);
    handler.addStudent(rajaStudent);
    handler.addStudent(kanithraStudent);

    




    system.debug('@@@@@@@'+handler.studentSet);
     system.assertEquals(3, handler.studentSet.size(),'msg');  
    }*/
    
    
    @IsTest
    static void testTotalSalaryOfMothers(){
        CynoStudent student1 = new CynoStudent();
        CynoStudent student2 = new CynoStudent();
        CynoStudent student3 = new CynoStudent();

        cynoparent stud1Mother = new CynoParent(new CynoName('Tom', 'Jerry','shershaw'),'female','mother',25000,'Teacher');
        cynoparent stud2Mother = new CynoParent(new CynoName('Tom', 'Jerry','shershaw'),'female','mother',55000,'Doctor');
        cynoparent stud3Mother = new CynoParent(new CynoName('Tom', 'Jerry','shershaw'),'female','mother',45000,'Police');

        student1.motherDetails=stud1Mother;
        student2.motherDetails=stud2Mother;
        student3.motherDetails=stud3Mother;

        CynoStudentAdmissionHandler handler = new CynoStudentAdmissionHandler();
        handler.addStudent(student1);
        handler.addStudent(student2);
        handler.addStudent(student3);
        system.debug('30'+JSON.serialize(handler.studentSet));
        system.debug('@@@@@@'+handler.studentSet);
        integer totalmothersalary = handler.getTotalSalaryOfMothers();
        system.debug('@@@@@@@@@'+totalmothersalary);
        system.debug('@@@@@@@'+JSON.serialize(handler.getTotalSalaryOfMothers()));
        system.assertEquals(125000, totalmothersalary,'msg');
    }
    testMethod static void testGetLstOfStudsWhoseMothersSalMoreThanFathersSal() {
        CynoStudentAdmissionHandler handler = new CynoStudentAdmissionHandler();
  
        CynoStudent student1 = new CynoStudent();
        CynoStudent student2 = new CynoStudent();
  
        CynoParent stud1Father = new CynoParent(new CynoName('Tom', 'Jerry','shershaw'),
                                                'Male',
                                                'Father',
                                                6000,
                                                'Doctor');
  
        CynoParent stud1Mother = new CynoParent(new CynoName('Micky', 'Mouse','Cherrysaw'),
                'Female',
                'Mother',
                8000,
                'Lawyer');
  
        CynoParent stud2Mother = new CynoParent(new CynoName('Crak', 'Jony',''),
                'Female',
                'Mother',
                6000,
                'Lawyer');
  
        CynoParent stud2Father = new CynoParent(new CynoName('Bin', 'cherry','George'),
                'Male',
                'Father',
                8000,
                'Doctor');
  
  
  
  
        student1.motherDetails = stud1Mother;
        student2.motherDetails = stud2Mother;
  
        student1.fatherDetails = stud1Father;
        student2.fatherDetails = stud2Father;
  
        handler.addStudent(student1);
        handler.addStudent(student2);
  
        List<CynoStudent> result = handler.getLstOfStudsWhoseMothersSalMoreThanFathersSal();
  
        System.assertEquals(1, result.size(),'msg');
  
        
    }
    testMethod static void testGetLstOfStudsWhoseFathersSalMoreThanMothersSal() {
        CynoStudentAdmissionHandler handler = new CynoStudentAdmissionHandler();
  
        CynoStudent student1 = new CynoStudent();
        CynoStudent student2 = new CynoStudent();
  
        CynoParent stud1Father = new CynoParent(new CynoName('Tom', 'Jerry','shershaw'),
                                                'Male',
                                                'Father',
                                                12000,
                                                'Doctor');
  
        CynoParent stud1Mother = new CynoParent(new CynoName('Micky', 'Mouse','Cherrysaw'),
                'Female',
                'Mother',
                8000,
                'Lawyer');
  
        CynoParent stud2Mother = new CynoParent(new CynoName('Crak', 'Jony',''),
                'Female',
                'Mother',
                6000,
                'Lawyer');
  
        CynoParent stud2Father = new CynoParent(new CynoName('Bin', 'cherry','George'),
                'Male',
                'Father',
                15000,
                'Doctor');
  
  
  
  
        student1.motherDetails = stud1Mother;
        student2.motherDetails = stud2Mother;
  
        student1.fatherDetails = stud1Father;
        student2.fatherDetails = stud2Father;
  
        handler.addStudent(student1);
        handler.addStudent(student2);
  
        List<CynoStudent> result = handler.getLstOfStudsWhoseFathersSalMoreThanMothersSal();
  
        System.assertEquals(2, result.size(),'msg');
  
        
    }
    testMethod static void testGetLstOfStudsWhoseMotherIsUnEmployeed() {
        CynoStudentAdmissionHandler handler = new CynoStudentAdmissionHandler();
  
        CynoStudent student1 = new CynoStudent();
        CynoStudent student2 = new CynoStudent();
  
        /*CynoParent stud1Father = new CynoParent(new CynoName('Tom', 'Jerry','shershaw'),
                                                'Male',
                                                'Father',
                                                12000,
                                                'Doctor');*/
  
        CynoParent stud1Mother = new CynoParent(new CynoName('Micky', 'Mouse','Cherrysaw'),
                'Female',
                'Mother',
                8000,
                'Null');
  
        CynoParent stud2Mother = new CynoParent(new CynoName('Crak', 'Jony',''),
                'Female',
                'Mother',
                6000,
                'Lawyer');
  
        /*CynoParent stud2Father = new CynoParent(new CynoName('Bin', 'cherry','George'),
                'Male',
                'Father',
                15000,
                'Doctor');*/
  
  
  
  
        student1.motherDetails = stud1Mother;
        student2.motherDetails = stud2Mother;
  
        //student1.fatherDetails = stud1Father;
        //student2.fatherDetails = stud2Father;
  
        handler.addStudent(student1);
        handler.addStudent(student2);
  
        List<CynoStudent> result = handler.getLstOfStudsWhoseMothersHaveUnEmployeed();
  
        System.assertEquals(1, result.size(),'msg');
  
        
    }
    testMethod static void testGetLstOfStudsWhoseFathersIsUnEmployeed() {
        CynoStudentAdmissionHandler handler = new CynoStudentAdmissionHandler();
  
        CynoStudent student1 = new CynoStudent();
        CynoStudent student2 = new CynoStudent();
  
        CynoParent stud1Father = new CynoParent(new CynoName('Tom', 'Jerry','shershaw'),
                                                'Male',
                                                'Father',
                                                12000,
                                                'Teacher');
  
        /*CynoParent stud1Mother = new CynoParent(new CynoName('Micky', 'Mouse','Cherrysaw'),
                'Female',
                'Mother',
                8000,
                'Null');8?
  
        CynoParent stud2Mother = new CynoParent(new CynoName('Crak', 'Jony',''),
                'Female',
                'Mother',
                6000,
                'Lawyer');*/
  
        CynoParent stud2Father = new CynoParent(new CynoName('Bin', 'cherry','George'),
                'Male',
                'Father',
                15000,
                'Null');
  
  
  
  
        //student1.motherDetails = stud1Mother;
        //student2.motherDetails = stud2Mother;
  
        student1.fatherDetails = stud1Father;
        student2.fatherDetails = stud2Father;
  
        handler.addStudent(student1);
        handler.addStudent(student2);
  
        List<CynoStudent> result = handler.getLstOfStudsWhoseFathersHaveUnEmployeed();
  
        System.assertEquals(1, result.size(),'msg');
  
        
    }
    testMethod static void testGetLstOfStudsWhoseFathersAndMothersIsUnEmployeed() {
        CynoStudentAdmissionHandler handler = new CynoStudentAdmissionHandler();
  
        CynoStudent student1 = new CynoStudent();
        CynoStudent student2 = new CynoStudent();
  
        CynoParent stud1Father = new CynoParent(new CynoName('Tom', 'Jerry','shershaw'),
                                                'Male',
                                                'Father',
                                                12000,
                                                'null');
  
        CynoParent stud1Mother = new CynoParent(new CynoName('Micky', 'Mouse','Cherrysaw'),
                'Female',
                'Mother',
                8000,
                'Null');
  
        CynoParent stud2Mother = new CynoParent(new CynoName('Crak', 'Jony',''),
                'Female',
                'Mother',
                6000,
                'Lawyer');
  
        CynoParent stud2Father = new CynoParent(new CynoName('Bin', 'cherry','George'),
                'Male',
                'Father',
                15000,
                'Doctor');
  
  
  
  
        student1.motherDetails = stud1Mother;
        student2.motherDetails = stud2Mother;
  
        student1.fatherDetails = stud1Father;
        student2.fatherDetails = stud2Father;
  
        handler.addStudent(student1);
        handler.addStudent(student2);
  
        List<CynoStudent> result = handler.getLstOfStudsWhoseFatherAndMotherUnEmployeed();
  
        System.assertEquals(1, result.size(),'msg');
  
        
    }
    testMethod static void testGetLstOfStudsBothFathersAndMothersIsEmployeed() {
        CynoStudentAdmissionHandler handler = new CynoStudentAdmissionHandler();
  
        CynoStudent student1 = new CynoStudent();
        CynoStudent student2 = new CynoStudent();
  
        CynoParent stud1Father = new CynoParent(new CynoName('Tom', 'Jerry','shershaw'),
                                                'Male',
                                                'Father',
                                                12000,
                                                'null');
  
        CynoParent stud1Mother = new CynoParent(new CynoName('Micky', 'Mouse','Cherrysaw'),
                'Female',
                'Mother',
                8000,
                'Null');
  
        CynoParent stud2Mother = new CynoParent(new CynoName('Crak', 'Jony',''),
                'Female',
                'Mother',
                6000,
                'Lawyer');
  
        CynoParent stud2Father = new CynoParent(new CynoName('Bin', 'cherry','George'),
                'Male',
                'Father',
                15000,
                'Doctor');
  
  
  
  
        student1.motherDetails = stud1Mother;
        student2.motherDetails = stud2Mother;
  
        student1.fatherDetails = stud1Father;
        student2.fatherDetails = stud2Father;
  
        handler.addStudent(student1);
        handler.addStudent(student2);
  
        List<CynoStudent> result = handler.getLstOfStudsBothFatherAndMotherEmployeed();
  
        System.assertEquals(1, result.size(),'msg');
  
        
    }
    testMethod static void testGetLstOfStudsIfAnyOfFathersAndMothersIsEmployeed() {
        CynoStudentAdmissionHandler handler = new CynoStudentAdmissionHandler();
  
        CynoStudent student1 = new CynoStudent();
        CynoStudent student2 = new CynoStudent();
  
        CynoParent stud1Father = new CynoParent(new CynoName('Tom', 'Jerry','shershaw'),
                                                'Male',
                                                'Father',
                                                12000,
                                                'Teacher');
  
        CynoParent stud1Mother = new CynoParent(new CynoName('Micky', 'Mouse','Cherrysaw'),
                'Female',
                'Mother',
                8000,
                'Nurse');
  
        CynoParent stud2Mother = new CynoParent(new CynoName('Crak', 'Jony',''),
                'Female',
                'Mother',
                6000,
                'null');
  
        CynoParent stud2Father = new CynoParent(new CynoName('Bin', 'cherry','George'),
                'Male',
                'Father',
                15000,
                'Doctor');
  
  
  
  
        student1.motherDetails = stud1Mother;
        student2.motherDetails = stud2Mother;
  
        student1.fatherDetails = stud1Father;
        student2.fatherDetails = stud2Father;
  
        handler.addStudent(student1);
        handler.addStudent(student2);
  
        List<CynoStudent> result = handler.getLstOfStudsIfAnyOfFatherAndMotherEmployeed();
  
        System.assertEquals(2, result.size(),'msg');
  
        
    }
    testMethod static void testGetLstOfStudsCurrentAndPermenantAddressDifferent() {
        CynoStudentAdmissionHandler handler = new CynoStudentAdmissionHandler();
  
        CynoStudent student1 = new CynoStudent();
        CynoStudent student2 = new CynoStudent();
  
        
        CynoAddress stud1CurrentAddress=new CynoAddress('Kamarajar street','police station back','Rasipuram','637505','TN','India');
        CynoAddress stud1PermenantAddress=new CynoAddress('Pandiyan strret','Opposite to railway station','erode','625417','TN','India');
        CynoAddress stud2CurrentAddress=new CynoAddress('Kamarajar street','police station back','Rasipuram','637505','TN','India');
        CynoAddress stud2PermenantAddress=new CynoAddress('Periyar street','LandDevelopment Bank','Namakkal','637510','TN','India');
        student1.currentAddress = stud1CurrentAddress;
        student2.currentAddress = stud2CurrentAddress;
  
        student1.permenentAddress = stud1PermenantAddress;
        student2.permenentAddress = stud2PermenantAddress;
  
        handler.addStudent(student1);
        handler.addStudent(student2);
  
        List<CynoStudent> result = handler.getAddressOfBothCurrentAndPermenantAddressDifferent();
  
        System.assertEquals(2, result.size(),'msg');
  
        
    }
    testMethod static void testGetLstOfStudsCurrentAndPermenantAddressEqual() {
        CynoStudentAdmissionHandler handler = new CynoStudentAdmissionHandler();
  
        CynoStudent student1 = new CynoStudent();
        CynoStudent student2 = new CynoStudent();
        //CynoAddress stud1CurrentAddress=new CynoAddress('Kamarajar street','police station back','Rasipuram','637505','TN','India');
        CynoAddress stud1PermenantAddress=new CynoAddress('','','','','','');
        //CynoAddress stud2CurrentAddress=new CynoAddress('Cholan Nahar','Kangaikondan','thanjavoor','368754','TN','India');
        CynoAddress stud2PermenantAddress=new CynoAddress('Cholan Nahar','Kangaikondan','thanjavoor','368754','TN','India');
        //student1.currentAddress = stud1CurrentAddress;
        //student2.currentAddress = stud2CurrentAddress;
  
        student1.permenentAddress = stud1PermenantAddress;
        student2.permenentAddress = stud2PermenantAddress;
  
        handler.addStudent(student1);
        handler.addStudent(student2);
  
        List<CynoStudent> result = handler.removeStudentwhosePermenantAddIsNull();
  
        System.assertEquals(2, result.size(),'msg');
  
        
    }
    testMethod static void testRemoveSTudWhosePermenAddIsEmpty() {
        CynoStudentAdmissionHandler handler = new CynoStudentAdmissionHandler();
  
        CynoStudent student1 = new CynoStudent();
        CynoStudent student2 = new CynoStudent();
  
        CynoAddress stud1PermenantAddress=new CynoAddress('','','','','','');

        CynoAddress stud2PermenantAddress=new CynoAddress('Cholan Nahar','Kangaikondan','thanjavoor','368754','TN','India');
 
        student1.permenentAddress = stud1PermenantAddress;
        student2.permenentAddress = stud2PermenantAddress;
       
        
        handler.addStudent(student1);
        handler.addStudent(student2);
  
  
        handler.removeStudentwhosePermenantAddIsNull();
        handler.removeStudentwhosePermenantAddIsNull();
       
  
        List<CynoStudent> result = handler.removeStudentwhosePermenantAddIsNull();
  
        System.assertEquals(2, result.size(),'msg');
  
        
    }
    testMethod static void testRemoveSTudWhoseCurrentAddIsEmpty() {
        CynoStudentAdmissionHandler handler = new CynoStudentAdmissionHandler();
  
        CynoStudent student1 = new CynoStudent();
        CynoStudent student2 = new CynoStudent();
  
        CynoAddress stud1CurrentAddress=new CynoAddress('Cholan Nahar','Kangaikondan','thanjavoor','368754','TN','India');

        CynoAddress stud2CurrentAddress=new CynoAddress('','','','','','');
 
        student1.permenentAddress = stud1CurrentAddress;
        student2.permenentAddress = stud2CurrentAddress;
       
        
        handler.addStudent(student1);
        handler.addStudent(student2);
  
  
        handler.removeStudentwhoseCurrentAddIsNull();
        handler.removeStudentwhoseCurrentAddIsNull();
       
  
        List<CynoStudent> result = handler.removeStudentwhoseCurrentAddIsNull();
  
        System.assertEquals(2, result.size(),'msg');
  
        
    }
      
}