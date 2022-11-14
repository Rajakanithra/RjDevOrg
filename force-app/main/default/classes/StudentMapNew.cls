public with sharing class StudentMapNew {
    public static void StudentMapNew() {
        Map<integer,Decimal>studentMap = new Map<integer,Decimal>();
        studentMap.put(1, 10000.0);
        studentMap.put(2, 20000.0);
        studentMap.put(3, 30000.0);
        studentMap.put(4, 40000.0);
        studentMap.put(5, 50000.0);

        //studentMap.put(2, new List<String>{'Class x','Class x'});
        //studentMap.put(3, new List<String>{'Class x','Class x'});
        //studentMap.put(44,new List<String>{'Class x','Class y'});
        //studentMap.put(43,new List<String>{'Class x','Class y'});
        //studentMap.put(49,new List<String>{'Class x','Class y'});
        //studentMap.put(53,new List<String>{'Class x','Class y'});
        
        //It will print key = value for all the elemenets in the map
        system.debug('It will print key = value for all the elemenets in the map '+studentMap);
        
        //To Display only key values from all the elements.
        system.debug('To Display only key values from all the elements. '+studentMap.keySet());
        
        //To Display only values from all the elements.
        system.debug('To Display only values from all the elements. '+studentMap.Values());
        
        //To get a value from map using a key (MapName.get(keySet) will return the value of the particular key)
        system.debug('To get a value from map using a key  '+studentMap.get(49));
        
        //creating set variables for storing Keys from studentMap:
        set<integer>keyset = new set<integer>();
        keyset=studentMap.keySet();
        //if roll number is odd class is X and even class is Y
        
        for(integer rollNumber:keyset)
        {
            if(math.mod(rollNumber,2)==0)
            {
                //studentMap.put(rollNumber,studentMap.get(rollNumber)/100*30 + studentMap.get(rollNumber));
                //studentMap.put(rollNumber, 30.0);
                decimal sal=studentMap.get(rollNumber);
                //system.debug('----->'+studentMap);
                decimal percent = sal*0.3;
                //system.debug('------->'+percent);
                decimal totalSalary=sal+percent;
                //system.debug('--------->'+totalSalary);
                studentMap.put(rollNumber,totalSalary);
                //system.debug('-------->'+studentMap);
                                      
            }
            else if(math.mod(rollNumber,2)!=0)
            {
                //studentMap.put(rollNumber,studentMap.get(rollNumber)/100*50 + studentMap.get(rollNumber));
                //studentMap.put(rollNumber, 30.0);
                decimal sal=studentMap.get(rollNumber);
                //system.debug('----->'+studentMap);
                decimal percent = sal*0.5;
                //system.debug('------->'+percent);
                decimal totalSalary=sal+percent;
                //system.debug('--------->'+totalSalary);
                studentMap.put(rollNumber,totalSalary);
                //system.debug('-------->'+studentMap);
            }
        }
        System.debug('odd Number(50%) and even Number(30%) salary Hike:'+studentMap);
        
    }
}