public class MyMapExample 
{
    public static Map<string,string> createNumericToRomanMap(Map<string,string> numeralsMap, Map<string,string> romanNumeralsMap)
    {
        Map<string,string> numeralroman = new Map<string,string>();
        for(String str: numeralsMap.keySet())
        {
         numeralroman.put(numeralsMap.get(str),romanNumeralsMap.get(str));   
        }
        system.debug('combination of numeral and romanmap'+numeralroman);
        return numeralroman;
        
    }
    
    public static Map<integer,String> reverseMap(Map<String,Integer> numeralmap1){
        Map<Integer,String> newmap1 = new Map<Integer,String>();
        for(String str: numeralmap1.keySet())
        {
            newmap1.put(numeralmap1.get(str),str);
        }
        system.debug('The reversed Map is'+newmap1);
        return newmap1;
    }
    public static Map<string,integer> createMapwithIntegerParam(Map<integer,string> map1,Map<string,string> map2){
        Map<string,integer> map3 = new Map<string,integer>();
        
        return map3;
    }
}