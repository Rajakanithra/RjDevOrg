@IsTest
public with sharing class ContactPersonHandlerTest {
   @IsTest
  static void testAddContact(){
       ContactPersonHandler handler = new ContactPersonHandler();
        ContactPerson c1 = new ContactPerson('raja','mani','12345','male','25');
        ContactPerson c2 = new ContactPerson('yoga','sri','1234567','female','20');
        ContactPerson c3 = new ContactPerson('kanithra','rajamanickam','789654','female','6');
        ContactPerson c4 = new ContactPerson('Eswaran','palani','123654','male','75');
        ContactPerson c5 = new ContactPerson('padma','periyasamy','785241','female','70');
        ContactPerson c6 = new ContactPerson('Raja','lakshmi','9629231629','female','52');
        ContactPerson c7 = new ContactPerson('vel','murugan','9865328956','male','55');
        contactperson c8 = new ContactPerson('dharshini','velmurugan','123654789','female','22');
        
    handler.addPerson(c1);
    handler.addPerson(c2);
    handler.addPerson(c3);
    handler.addPerson(c4);
    handler.addPerson(c5);
    handler.addPerson(c6);
    handler.addPerson(c7);
    handler.addPerson(c8);
    system.debug('before serialize'+handler.ContactPersonList);
    string jsonString=JSON.serialize(handler.ContactPersonList);
    List<ContactPerson> res = handler.ContactPersonList;
    system.debug('after serialize'+jsonString);
    system.assertEquals(8,res.size(),'msg');
    
   }
}