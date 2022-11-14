public class VowelConsonant {
    public static void main(String Name) 
    {
        String[] stringCharacters = name.split('');
        String[] vowCharacters = new String[] {'a','e','i','o','u'};      
        for(integer i=0; i< Name.length(); i++)
        {
            if(vowCharacters.contains(stringCharacters[i]))
            {
                system.debug('Yes '+stringCharacters[i]);
            }
            else
            {
                system.debug('No  '+stringCharacters[i]);  
            }
        }
    }    
}