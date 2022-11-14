public with sharing class CynoStudentAdmissionListHandler {
    public List<CynoStudent> studentList{get;set;}
    public CynoStudentAdmissionListHandler() {
        this.studentList = new list<CynoStudent>();
    }
    public void addStudent(CynoStudent student) {
        this.studentList.add(student);
    }
    public void removeStudent(CynoStudent student) {
        //this.studentList.remove(student);
     }
     public integer getTotalSalaryOfMother(){
        integer totalsalary=0;
        for(cynostudent student:studentList){
            CynoParent motherDetails = student.motherDetails;
            totalsalary=totalsalary+motherDetails.yearSalary;
        }
        return totalsalary;
     }
     public List<CynoStudent> getLstOfStudsWhoseMothersSalMoreThanFathersSal() {
        List<CynoStudent> studentsList = new List<CynoStudent>();
        for(CynoStudent student : this.studentList) {
            System.debug('@@@@@@@@ 23 @@@@@@@ Student '+student);
            CynoParent mother = student.motherDetails;
            CynoParent father = student.fatherDetails;
            System.debug('@@@@@@@@ 26 @@@@@@@ mother '+mother);
            System.debug('@@@@@@@@ 27 @@@@@@@ father '+father);

            System.debug('@@@@@@@@ 29 @@@@@@@ mother salary '+mother.yearSalary);
            System.debug('@@@@@@@@ 30 @@@@@@@ father salary '+father.yearSalary);
            CynoParent highestsalary = CynosureGenericUtility.getRecordWithMoreSalary(mother, father);
            System.debug('@@@@@@@@ 32 @@@@@@@ Result '+highestsalary);
            if(highestsalary ==  mother) {
                System.debug('@@@@@@@ 34 @@@@@@ highest parent '+highestsalary);
                studentsList.add(student);
            }
        }
        return studentsList;
}
    public List<CynoStudent> getListOfStudWhoseFatherSalMoreThanMotherSal(){
        List<CynoStudent> studentList = new List<CynoStudent>();
        for(CynoStudent student : this.studentList){
            CynoParent mother = student.motherDetails;
            CynoParent father = student.fatherDetails;
            System.debug('@@@@@@@@ 45 @@@@@@@ father '+mother);
            System.debug('@@@@@@@@ 46 @@@@@@@ mother '+father);
            System.debug('@@@@@@@@ 47 @@@@@@@ father salary '+mother.yearSalary);
            System.debug('@@@@@@@@ 48 @@@@@@@ mother salary '+father.yearSalary);
            CynoParent highestsal = CynosureGenericUtility.getRecordWithMoreSalary(mother, father);
            system.debug('@@@@@@@@ 50 @@@@@@@'+highestsal);
            if(highestsal == father){
                studentList.add(student);
            }
        }
        return studentList;
    }
    public List<CynoStudent> getLstOfStudsWhoseMothersHaveUnEmployeed() {
        List<CynoStudent> studentsList = new List<CynoStudent>();
        for(CynoStudent student : this.studentList) {
            System.debug('@@@@@@@@ 60 @@@@@@@ Student '+student);
            CynoParent mother = student.motherDetails;
            
            System.debug('@@@@@@@@ 63 @@@@@@@ mother '+mother);
           

            System.debug('@@@@@@@@ 66 @@@@@@@ mother Occupation '+mother.occupation);
            
            if(mother.occupation == 'Null') {
                
                studentsList.add(student);
            }
        }
        return studentsList;
    }
    public List<CynoStudent> getLstOfStudsWhoseFathersHaveUnEmployeed() {
        List<CynoStudent> studentsList = new List<CynoStudent>();
        for(CynoStudent student : this.studentList) {
            System.debug('@@@@@@@@ 78 @@@@@@@ Student '+student);
           
            CynoParent father = student.fatherDetails;
           
            System.debug('@@@@@@@@ 82 @@@@@@@ father '+father);

            System.debug('@@@@@@@@ 84 @@@@@@@ Father Occupation'+father.occupation);
            
            if(father.occupation == 'Null') {
                
                studentsList.add(student);
            }
        }
        return studentsList;
    }
    public List<CynoStudent> getLstOfStudsWhoseFatherAndMotherUnEmployeed() {
        List<CynoStudent> studentsList = new List<CynoStudent>();
        for(CynoStudent student : this.studentList) {
            System.debug('@@@@@@@@ 96 @@@@@@@ Student '+student);
            CynoParent mother = student.motherDetails;
            CynoParent father = student.fatherDetails;
            System.debug('@@@@@@@@ 99 @@@@@@@ mother '+mother);
            System.debug('@@@@@@@@ 100 @@@@@@@ father '+father);

            System.debug('@@@@@@@@ 102 @@@@@@@ Father Occupation '+father.occupation);
            System.debug('@@@@@@@@ 103 @@@@@@@ Mother Occupation '+mother.occupation);
            
            if(father.occupation == 'Null' && mother.occupation == 'Null') {
                
                studentsList.add(student);
            }
        }
        return studentsList;
    }
    public List<CynoStudent> getLstOfStudsBothFatherAndMotherEmployeed() {
        List<CynoStudent> studentsList = new List<CynoStudent>();
        for(CynoStudent student : this.studentList) {
            System.debug('@@@@@@@@ 115 @@@@@@@ Student '+student);
            CynoParent mother = student.motherDetails;
            CynoParent father = student.fatherDetails;
            System.debug('@@@@@@@@ 118 @@@@@@@ mother '+mother);
            System.debug('@@@@@@@@ 119 @@@@@@@ father '+father);

            System.debug('@@@@@@@@ 121 @@@@@@@ Father Occupation '+father.occupation);
            System.debug('@@@@@@@@ 122 @@@@@@@ Mother Occupation '+mother.occupation);
            
            if(father.occupation != 'Null' && mother.occupation != 'Null') {
               
                studentsList.add(student);
            }
        }
        return studentsList;
    }
    public List<CynoStudent> getLstOfStudsIfAnyOfFatherAndMotherEmployeed() {
        List<CynoStudent> studentsList = new List<CynoStudent>();
        for(CynoStudent student : this.studentList) {
            System.debug('@@@@@@@@ 134 @@@@@@@ Student '+student);
            CynoParent mother = student.motherDetails;
            CynoParent father = student.fatherDetails;
            System.debug('@@@@@@@@ 137 @@@@@@@ mother '+mother);
            System.debug('@@@@@@@@ 138 @@@@@@@ father '+father);

            System.debug('@@@@@@@@ 140 @@@@@@@ father Occupation '+father.occupation);
            System.debug('@@@@@@@@ 141 @@@@@@@ Mother Occupation '+mother.occupation);
            
            if(father.occupation != 'Null' || mother.occupation != 'Null') {
               
                studentsList.add(student);
            }
        }
        return studentsList;
    }
    public List<CynoStudent> getAddressOfBothCurrentAndPermenantAddressDifferent() 
    {
        List<CynoStudent> studentsList = new List<CynoStudent>();
        for(CynoStudent student : this.studentList) {
            System.debug('@@@@@@@@ 154 @@@@@@@ Student '+student);
            CynoAddress currAdd = student.currentAddress;
            CynoAddress perAdd = student.permenentAddress;
            System.debug('@@@@@@@@ 157 @@@@@@@ mother '+currAdd);
            System.debug('@@@@@@@@ 158 @@@@@@@ father '+perAdd);
            CynoAddress nonUnique = CynosureGenericUtility.getNonUniqueAddress(currAdd, perAdd);
            System.debug('@@@@@@@@ 160 @@@@@@@ Result '+nonUnique);
            
            if(nonUnique != null){
                studentsList.add(student);  
            }
             
        }
        return studentsList;
}
public List<CynoStudent> getAddressOfBothCurrentAndPermenantAddressEqual() 
    {
        List<CynoStudent> studentsList = new List<CynoStudent>();
        for(CynoStudent student : this.studentList) {
            System.debug('@@@@@@@@ 173 @@@@@@@ Student '+student);
            CynoAddress currAdd = student.currentAddress;
            CynoAddress perAdd = student.permenentAddress;
            System.debug('@@@@@@@@ 176 @@@@@@@ mother '+currAdd);
            System.debug('@@@@@@@@ 177 @@@@@@@ father '+perAdd);
            CynoAddress Unique = CynosureGenericUtility.getUniqueAddress(currAdd, perAdd);
            System.debug('@@@@@@@@ 179 @@@@@@@ Result '+Unique);
            
            if(Unique != null){
                studentsList.add(student);  
            }
             
        }
        return studentsList;
}


}