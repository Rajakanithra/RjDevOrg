public class CynoParent {
    public CynoName nameDetails{get;set;}
    public string gender{get;set;}
    public string parentType{get;set;}//Father  //Mother  //Guardian
    public Integer yearSalary{get;set;}
    public string occupation{get;set;}
    public Boolean NoJob{get;set;}
    public CynoParent(CynoName cName,String gender,String pType,Integer ySal,String occu){
        this.nameDetails=cName;
        this.gender=gender;
        this.parentType=pType;
        this.yearSalary=ySal;
        this.occupation=occu;
        if(this.occupation==null){
            this.NoJob=true;
        }
    }
}