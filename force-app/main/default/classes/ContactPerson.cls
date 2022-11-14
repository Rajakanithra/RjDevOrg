public with sharing class ContactPerson {
    public String firstName{get;set;}
    public String lastName{get;set;}
    Public String phone{get;set;}
    public String gender{get;set;}
    public String age{get;set;}
    public ContactPerson(String fname,String lname,String phn,String gen,String age){
        this.firstName=fname;
        this.lastName=lname;
        this.phone=phn;
        this.gender=gen;
        this.age=age;
    }
}