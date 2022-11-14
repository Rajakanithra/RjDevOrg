public class MatchParanthesis {
/*public static boolean checkBalancedBrackets(String strlist){
    String str =strlist;
    String newstr='';
    
    boolean isBalanced;
        
    for(integer i=1; i< strlist.length(); i++){
        System.debug('Length of string is:  ' + str.length());
        str=str.remove('{}');
        str=str.remove('()');
        str=str.remove('<>');
        str=str.remove('[]');
        
        System.debug('New SS is:'+ str);             
        
        /*if (newstr==str)
            break;          
            
        newstr=str;
    }
        
    if(str.length()>0){
        isBalanced = false;
        System.debug('It is not balanced string');
    }
    else{
        isBalanced = true;
        System.debug('It is balanced string');
    }
        

    return isBalanced;
    
}*/
    public static void matchingParanthesisUsingstack(string input){
        List<String>stack = new List<String>();
        integer stackpointer=-1;
        for(String curreItem : input.split('')){
            if(stack.isEmpty()){
                stack.add(curreItem);
                stackpointer++;
            }
            else{
                string topchar = stack.get(stackpointer);
                if((topchar=='('&& curreItem==')')||(topchar=='['&& curreItem==']')||(topchar =='{' && curreItem =='}')){
                    stack.remove(stackpointer);
                    stackpointer--;
                }
                else
                {
                    stack.add(curreItem);
                    stackpointer++;
                }
                    
            }
        }
        if(stack.isEmpty()){
           system.debug('the result is true');
            
        }
        else{
            system.debug('the result is false');
            
        }
    }
}