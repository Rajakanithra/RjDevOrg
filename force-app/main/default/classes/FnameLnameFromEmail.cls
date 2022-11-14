public class FnameLnameFromEmail {
    public static void nameFromEmail(String email){
        String leftString = email.substringBefore('@');
        String[] leftStringSplitted = leftString.split('\\.');
        if(leftStringSplitted.size() == 2){
            String firstName =leftStringSplitted[0];
            String lastName = leftStringSplitted[1];
            system.debug('The First and Last Name of the String is:'+firstName.substring(0,2).toUpperCase()+firstName.substring(2)+','+lastName.substring(0,1).toUpperCase()+lastName.substring(1));
            system.debug('The First and Last Name of the String is:'+firstName.toUpperCase()+ ','+lastName.toUpperCase());
            system.debug('The First and Last name of the String is:'+firstName.capitalize()+','+lastName.capitalize());
        }
    }
    public static void reverseString(String inputString){
        //string revString='';
        String revString = inputString.reverse();
        system.debug('the string is:'+revString); 
        if(inputString.equals(revString)){
            system.debug('The Given String is Polindrome');
        }
        else
        {
            system.debug('The Given Strig is Not a Polindrome String');
        } 
        
    }
    public static void reverseString1(String ioString){
        String str = ioString.toLowerCase();
        system.debug('The String is:'+str);
        Integer length = str.length();
        String strnosplchar ='';
        
        for(integer i=0;i<length;i++){
            String stringAtI = str.substring(i,i+1);
            Boolean alphaNumeric = stringAtI.isAlphanumeric();
            if(alphaNumeric)
            {
                strnosplchar = strnosplchar + stringAtI;
                //system.debug('the String is:'+strnosplchar); 
            }
        }
        system.debug('the String is:'+strnosplchar);
        if(strnosplchar == strnosplchar.reverse()){
            system.debug('the string is polindrom');
        }
        else
        {
            system.debug('the string is not polindrom');  
        }
        
        
    }   
    
    //system.debug('the String is:'+strnosplchar);
    /*if(alphaNumeric == alphaNumeric.reverse()){
system.debug('the string is polindrom');
}
else{
system.debug('the string is not polindrom ');  
}*/
    
    public static void stringHandler(String ioString){
        String str1 = ioString.toLowerCase();
        system.debug('The String is:'+str1);
        system.debug('The String is:'+str1.substring(4));
        system.debug('The String is:'+str1.substring(0,4));
        system.debug('The String is:'+str1.capitalize());
        system.debug('The String is:'+str1.substring(0, 1));
        system.debug('The String is:'+str1.substring(0, 2));
        system.debug('The String is:'+str1.substring(0, 3));
        system.debug('The String is:'+str1.substring(0, 4));
        system.debug('The String is:'+str1.substring(0, 1));
        system.debug('The String is:'+str1.substring(1, 2));
        system.debug('The String is:'+str1.substring(2, 3));
        system.debug('The String is:'+str1.substring(3, 4));
        
    }
    public static void reverseNumber(integer str){
        integer rem;
        integer rev;
        integer originalNum = str;
        
        for(;str !=0; str/10){
            rem = math.mod(str, 10);
            rev = rev * 10 + rem;
        }
        if(originalNum == rev){
            system.debug('The number is polindrom');
        }
        else{
            system.debug('The Number is not Polindrom');
        }
    }
}