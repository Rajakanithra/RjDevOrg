public class School {
public String name;
public string schoolAddress;
    public School(String Sname,String Address){
        this.name=Sname;
        this.schoolAddress=Address;
        this.printSchoolName();//method declaration
        
    }
    //method definition
    public void printSchoolName(){
        system.debug('School Name:'+name);
        system.debug('School Address:'+schoolAddress);
    }
}