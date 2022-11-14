@IsTest
public with sharing class CynoStudentAdmissionListHandlerTest {
   @IsTest
   static void testAddStudent(){
    CynoStudentAdmissionListHandler handler = new CynoStudentAdmissionListHandler();
    CynoStudent student1 = new CynoStudent();
    CynoName student1Name = new CynoName('Raja','Manickam','Rj');
    student1.nameDetails = student1Name;

    CynoStudent student2 = new CynoStudent();
    CynoName student2Name = new CynoName('Yoga','Sri','yoga');
    student2.nameDetails = student2Name;

    CynoStudent student3 = new CynoStudent();
    CynoName student3Name = new CynoName('Kanithra','RajaManickam','RjKani');
    student3.nameDetails = student3Name;

    handler.addStudent(student1);
    handler.addStudent(student2);
    handler.addStudent(student3);

    system.debug('@@@@@@@@@ 19 @@@@@@'+handler.studentList);

    system.assertEquals(3, handler.studentList.size(),'msg');
   }
   @IsTest
   static void testGetTotalSalaryOfMother(){
      CynoStudent student1 = new CynoStudent();
      CynoStudent student2 = new CynoStudent();
      CynoStudent student3 = new CynoStudent();

      CynoParent stu1mother = new CynoParent(new CynoName('Tom', 'Jerry','shershaw'),'female','mother',25000,'Teacher');
      CynoParent stu2mother = new CynoParent(new CynoName('raja', 'manickam','rj'),'female','mother',25000,'Teacher');
      CynoParent stu3mother = new CynoParent(new CynoName('yoga', 'sri','yoga'),'female','mother',25000,'Teacher');

      student1.motherDetails = stu1mother;
      student2.motherDetails = stu2mother;
      student3.motherDetails = stu3mother;

      CynoStudentAdmissionListHandler handler = new CynoStudentAdmissionListHandler();
      handler.addStudent(student1);
      handler.addStudent(student2);
      handler.addStudent(student3);

      system.debug('30'+JSON.serialize(handler.studentList));
        system.debug('@@@@@@'+handler.studentList);
        integer totalmothersal = handler.getTotalSalaryOfMother();
        system.debug('@@@@@@@@@'+totalmothersal);
        system.debug('@@@@@@@'+JSON.serialize(handler.getTotalSalaryOfMother()));
        system.assertEquals(75000, totalmothersal,'msg');

      
   }
   @IsTest
   static void testStudentWHoseMotherSalMoreThanFathersal(){
      CynoStudentAdmissionListHandler handler = new CynoStudentAdmissionListHandler();
      CynoStudent student1 = new CynoStudent();
      CynoStudent student2 = new CynoStudent();
      CynoParent stu1father = new CynoParent(new CynoName('Tom', 'Jerry','shershaw'),'male','father',25000,'Teacher');
      CynoParent stu1mother = new CynoParent(new CynoName('Tom', 'Jerry','shershaw'),'female','mother',35000,'doctor');
      CynoParent stu2father = new CynoParent(new cynoname('eswaran','Eswaran','eswar'),'male','father',30000,'lawyer');
      CynoParent stu2mother = new CynoParent(new cynoname('padma','vathi','padmavathi'),'female','mother',45000,'teacher');

      student1.fatherDetails=stu1father;
      student2.fatherDetails=stu2father;

      student1.motherDetails=stu1mother;
      student2.motherDetails=stu2mother;

      handler.addStudent(student1);
      handler.addStudent(student2);

      List<CynoStudent> result = handler.getLstOfStudsWhoseMothersSalMoreThanFathersSal();
      system.debug('@@@@@@ 74 @@@@@@'+result);

      system.assertEquals(2, result.size(),'msg');
   }
   @IsTest
   static void testStudentWHoseFatherSalMoreThanMothersal(){
      CynoStudentAdmissionListHandler handler = new CynoStudentAdmissionListHandler();
      CynoStudent student1 = new CynoStudent();
      CynoStudent student2 = new CynoStudent();
      CynoParent stu1father = new CynoParent(new CynoName('Tom', 'Jerry','shershaw'),'male','father',45000,'Teacher');
      CynoParent stu1mother = new CynoParent(new CynoName('Tom', 'Jerry','shershaw'),'female','mother',35000,'doctor');
      CynoParent stu2father = new CynoParent(new CynoName('eswaran','Eswaran','eswar'),'male','father',50000,'lawyer');
      CynoParent stu2mother = new CynoParent(new CynoName('padma','vathi','padmavathi'),'female','mother',45000,'teacher');

      student1.fatherDetails=stu1father;
      student2.fatherDetails=stu2father;

      student1.motherDetails=stu1mother;
      student2.motherDetails=stu2mother;

      handler.addStudent(student1);
      handler.addStudent(student2);

      List<CynoStudent> result = handler.getListOfStudWhoseFatherSalMoreThanMotherSal();
      system.debug('@@@@@@ 98 @@@@@@'+result);

      system.assertEquals(2, result.size(),'msg');
   }
   testMethod static void testGetLstOfStudsWhoseMotherIsUnEmployeed() {
      CynoStudentAdmissionHandler handler = new CynoStudentAdmissionHandler();

      CynoStudent student1 = new CynoStudent();
      CynoStudent student2 = new CynoStudent();
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

      student1.motherDetails = stud1Mother;
      student2.motherDetails = stud2Mother;

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

   CynoParent stud2Father = new CynoParent(new CynoName('Bin', 'cherry','George'),
           'Male',
           'Father',
           15000,
           'Null');
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
}