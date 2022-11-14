public class contactCreateclass 
{
@AuraEnabled
public static void Contactcreation(Contact conobj)
{
    system.debug('Contact:'+conobj.FirstName);
    insert conobj;
}
    @AuraEnabled
    public static List<Contact> retrieveContact()
    {
        return[select id,FirstName,LastName,Phone from Contact order by createdDate DESC LIMIT 10];
    }
}