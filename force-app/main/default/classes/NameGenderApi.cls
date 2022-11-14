public class NameGenderApi extends TriggerFramework {
    public override void afterInsert(){
        List<Id> contId = new List<Id>();
        string conId;
        for(Contact con :(List<Contact>)Trigger.new){
            contId.add(con.Id);
            conId = con.id;
        }
        //ContactApiCallout.findAndSaveGenderForSingleContact(conId);
        //ContactApiCallout.findAndSaveCountryCodeForMultipleContacts(contId);
         //ContactApiCallout.findAndSaveGenderForMultipleContacts(contId);
    }
}