public with sharing class CynoStudentAdmissionHandler {
    public Set<CynoStudent> studentSet {get;set;}
    public CynoStudentAdmissionHandler() {
        this.studentSet=new Set<CynoStudent>();
    }
    
    public void addStudent(CynoStudent student) {
        this.studentSet.add(student);
    }
    public void removeStudent(CynoStudent student) {
       this.studentSet.remove(student);
    }
    public Integer getStudentCount() {
        return studentSet.size();
    }
    public  Integer getWorkingMothersCount()  {
        return 0;
    }
    public Integer getWorkingFathersCount() {
        return 0;
    }
    public Decimal getTotalParentsSalaryOfStudent(CynoStudent student) {
        return 0;
    }
    public Integer getStudentCountLessThanSalary(Decimal salaryThreshold) {
        return 0;
    }
    public Integer getHowManyStudentsShouldGetDiscountOnParentsSalary(Decimal salaryThreshold) {
        return 0;
    }
    public integer getTotalSalaryOfMothers(){
        integer totalSalary=0;
        for(CynoStudent student:studentSet){
            CynoParent motherDetails = student.motherDetails;
            totalSalary = totalSalary + motherDetails.yearSalary;
        }
        return totalSalary;
    }
    public List<CynoStudent> getLstOfStudsWhoseMothersSalMoreThanFathersSal() {
        List<CynoStudent> studentsList = new List<CynoStudent>();
        for(CynoStudent student : this.studentSet) {
            System.debug('@@@@@@@@ 42 @@@@@@@ Student '+student);
            CynoParent mother = student.motherDetails;
            CynoParent father = student.fatherDetails;
            System.debug('@@@@@@@@ 45 @@@@@@@ mother '+mother);
            System.debug('@@@@@@@@ 46 @@@@@@@ father '+father);

            System.debug('@@@@@@@@ 48 @@@@@@@ mother salary '+mother.yearSalary);
            System.debug('@@@@@@@@ 49 @@@@@@@ father salary '+father.yearSalary);
            CynoParent highestParentInSal = CynosureGenericUtility.getRecordWithMoreSalary(mother, father);
            System.debug('@@@@@@@@ 51 @@@@@@@ Result '+highestParentInSal);
            if(highestParentInSal ==  mother) {
                System.debug('@@@@@@@ 53 @@@@@@ highest parent '+highestParentInSal);
                studentsList.add(student);
            }
        }
        return studentsList;
    }
    public List<CynoStudent> getLstOfStudsWhoseFathersSalMoreThanMothersSal() {
        List<CynoStudent> studentsList = new List<CynoStudent>();
        for(CynoStudent student : this.studentSet) {
            System.debug('@@@@@@@@ 62 @@@@@@@ Student '+student);
            CynoParent mother = student.motherDetails;
            CynoParent father = student.fatherDetails;
            System.debug('@@@@@@@@ 65 @@@@@@@ mother '+mother);
            System.debug('@@@@@@@@ 66 @@@@@@@ father '+father);

            System.debug('@@@@@@@@ 68 @@@@@@@ mother salary '+mother.yearSalary);
            System.debug('@@@@@@@@ 69 @@@@@@@ father salary '+father.yearSalary);
            CynoParent highestParentInSal = CynosureGenericUtility.getRecordWithMoreSalary(mother, father);
            System.debug('@@@@@@@@ 71 @@@@@@@ Result '+highestParentInSal);
            if(highestParentInSal ==  father) {
                System.debug('@@@@@@@ 73 @@@@@@ highest parent '+highestParentInSal);
                studentsList.add(student);
            }
        }
        return studentsList;
    }
    public List<CynoStudent> getLstOfStudsWhoseMothersHaveUnEmployeed() {
        List<CynoStudent> studentsList = new List<CynoStudent>();
        for(CynoStudent student : this.studentSet) {
            System.debug('@@@@@@@@ 82 @@@@@@@ Student '+student);
            CynoParent mother = student.motherDetails;
            
            System.debug('@@@@@@@@ 85 @@@@@@@ mother '+mother);
           

            System.debug('@@@@@@@@ 88 @@@@@@@ mother Occupation '+mother.occupation);
            
            if(mother.occupation == 'Null') {
                
                studentsList.add(student);
            }
        }
        return studentsList;
    }
    public List<CynoStudent> getLstOfStudsWhoseFathersHaveUnEmployeed() {
        List<CynoStudent> studentsList = new List<CynoStudent>();
        for(CynoStudent student : this.studentSet) {
            System.debug('@@@@@@@@ 100 @@@@@@@ Student '+student);
           
            CynoParent father = student.fatherDetails;
           
            System.debug('@@@@@@@@ 104 @@@@@@@ father '+father);

            System.debug('@@@@@@@@ 106 @@@@@@@ Father Occupation'+father.occupation);
            
            if(father.occupation == 'Null') {
                
                studentsList.add(student);
            }
        }
        return studentsList;
    }
    public List<CynoStudent> getLstOfStudsWhoseFatherAndMotherUnEmployeed() {
        List<CynoStudent> studentsList = new List<CynoStudent>();
        for(CynoStudent student : this.studentSet) {
            System.debug('@@@@@@@@ 118 @@@@@@@ Student '+student);
            CynoParent mother = student.motherDetails;
            CynoParent father = student.fatherDetails;
            System.debug('@@@@@@@@ 121 @@@@@@@ mother '+mother);
            System.debug('@@@@@@@@ 122 @@@@@@@ father '+father);

            System.debug('@@@@@@@@ 124 @@@@@@@ Father Occupation '+father.occupation);
            System.debug('@@@@@@@@ 125 @@@@@@@ Mother Occupation '+mother.occupation);
            
            if(father.occupation == 'Null' && mother.occupation == 'Null') {
                
                studentsList.add(student);
            }
        }
        return studentsList;
    }
    public List<CynoStudent> getLstOfStudsBothFatherAndMotherEmployeed() {
        List<CynoStudent> studentsList = new List<CynoStudent>();
        for(CynoStudent student : this.studentSet) {
            System.debug('@@@@@@@@ 137 @@@@@@@ Student '+student);
            CynoParent mother = student.motherDetails;
            CynoParent father = student.fatherDetails;
            System.debug('@@@@@@@@ 140 @@@@@@@ mother '+mother);
            System.debug('@@@@@@@@ 141 @@@@@@@ father '+father);

            System.debug('@@@@@@@@ 143 @@@@@@@ Father Occupation '+father.occupation);
            System.debug('@@@@@@@@ 144 @@@@@@@ Mother Occupation '+mother.occupation);
            
            if(father.occupation != 'Null' && mother.occupation != 'Null') {
               
                studentsList.add(student);
            }
        }
        return studentsList;
    }
    public List<CynoStudent> getLstOfStudsIfAnyOfFatherAndMotherEmployeed() {
        List<CynoStudent> studentsList = new List<CynoStudent>();
        for(CynoStudent student : this.studentSet) {
            System.debug('@@@@@@@@ 156 @@@@@@@ Student '+student);
            CynoParent mother = student.motherDetails;
            CynoParent father = student.fatherDetails;
            System.debug('@@@@@@@@ 159 @@@@@@@ mother '+mother);
            System.debug('@@@@@@@@ 160 @@@@@@@ father '+father);

            System.debug('@@@@@@@@ 162 @@@@@@@ father Occupation '+father.occupation);
            System.debug('@@@@@@@@ 163 @@@@@@@ Mother Occupation '+mother.occupation);
            
            if(father.occupation != 'Null' || mother.occupation != 'Null') {
               
                studentsList.add(student);
            }
        }
        return studentsList;
    }
    public List<CynoStudent> getAddressOfBothCurrentAndPermenantAddressDifferent() 
    {
        List<CynoStudent> studentsList = new List<CynoStudent>();
        for(CynoStudent student : this.studentSet) {
            System.debug('@@@@@@@@ 176 @@@@@@@ Student '+student);
            CynoAddress currAdd = student.currentAddress;
            CynoAddress perAdd = student.permenentAddress;
            System.debug('@@@@@@@@ 179 @@@@@@@ mother '+currAdd);
            System.debug('@@@@@@@@ 180 @@@@@@@ father '+perAdd);
            CynoAddress nonUnique = CynosureGenericUtility.getNonUniqueAddress(currAdd, perAdd);
            System.debug('@@@@@@@@ 182 @@@@@@@ Result '+nonUnique);
            
            if(nonUnique != null){
                studentsList.add(student);  
            }
             
        }
        return studentsList;
}
    
/*public List<CynoStudent> getAddressOfBothCurrentAndPermenantAddressDifferent(){
    List<CynoStudent> studentList=new List<CynoStudent>();
    for(CynoStudent student: studentSet){
        CynoAddress add1=student.currentAddress;
        CynoAddress add2=student.permenentAddress;
        if(student.currentAddress != student.permenentAddress){
            studentList.add(student);
        }
        
    }
    return studentList;
} */
public List<CynoStudent> getAddressOfBothCurrentAndPermenantAddressEqual() 
    {
        List<CynoStudent> studentsList = new List<CynoStudent>();
        for(CynoStudent student : this.studentSet) {
            System.debug('@@@@@@@@ 208 @@@@@@@ Student '+student);
            CynoAddress currAdd = student.currentAddress;
            CynoAddress perAdd = student.permenentAddress;
            System.debug('@@@@@@@@ 211 @@@@@@@ mother '+currAdd);
            System.debug('@@@@@@@@ 212 @@@@@@@ father '+perAdd);
            CynoAddress Unique = CynosureGenericUtility.getUniqueAddress(currAdd, perAdd);
            System.debug('@@@@@@@@ 214 @@@@@@@ Result '+Unique);
            
            if(Unique != null){
                studentsList.add(student);  
            }
             
        }
        return studentsList;
}
public List<CynoStudent> removeStudentwhosePermenantAddIsNull(){
    List<CynoStudent> studentList = new List<CynoStudent>();
    for(CynoStudent student:studentSet){
        system.debug('@@@@@@@@ 227 studnet list before remove @@@@@@'+studentList);
        CynoAddress permAdd = student.permenentAddress;
        CynoAddress removestu = CynosureGenericUtility.removeAddressIfPermIsEmpty(permAdd);
        if(!studentSet.isEmpty())
        {
          studentList.add(student);  
        }
        if(removestu == null && !studentList.isEmpty()){
            studentSet.removeAll(studentList);
        }
        system.debug('@@@@@@@@ 234 studnet list after removed @@@@@@'+studentList);
    }
    return studentList;
    
}
public List<CynoStudent> removeStudentwhoseCurrentAddIsNull(){
    List<CynoStudent> studentList = new List<CynoStudent>();
    for(CynoStudent student:studentSet){
        system.debug('@@@@@@@@ 244 studnet list before remove @@@@@@'+studentList);
        CynoAddress currentadd = student.currentAddress;
        CynoAddress removestu = CynosureGenericUtility.removeAddressIfCurrIsEmpty(currentadd);
        if(!studentSet.isEmpty())
        {
          studentList.add(student);  
        }
        if(removestu == null && !studentList.isEmpty()){
            studentSet.removeAll(studentList);
        }
        system.debug('@@@@@@@@ 254 studnet list after removed @@@@@@'+studentList);
    }
    return studentList;
    
}
}