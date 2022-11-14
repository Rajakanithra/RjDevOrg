public with sharing class PassBy {
    public static void multiplyByPI(double radius){
        double area,pi=3.142;
        area=pi*radius*radius;
        system.debug('The values of circle is:'+area);
    }
    public static void getCharOfFirstTwo(String myString){
        myString=myString+'Cynosure';
        system.debug('The String is:'+myString);
        if(myString.length()>=2){
          system.debug('The result is:'+myString.substring(0,2)); 
            
        }
        else{
          system.debug('Please enter the string more than two characters');  
        }
        
    }
    public static void addStringToSet(Set<String> family){
        system.debug('Before the Add Method Works:'+family);
        family.add('Kanithtra');
        system.debug('After the add Full Set of Family is:'+family);
    }
}