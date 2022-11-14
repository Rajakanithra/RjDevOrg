public with sharing class ContactPersonHandler {
    public List<ContactPerson> ContactPersonList{get;set;}
    public ContactPersonHandler() {
        this.ContactPersonList=new List<ContactPerson>();
    }
    public void addPerson(ContactPerson contact){
        this.ContactPersonList.add(contact);
    }
}