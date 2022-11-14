public with sharing class studentMapnew1 {
    public void studentMapnew1() {
        Map<integer,String>studentMap = new Map<integer,String>();
        studentMap.put(1,'class x');//studentMap.put(1,new List<String>{'class X','class Y'});
        studentMap.put(2,'class x');
        studentMap.put(3,'class x');
        studentMap.put(44,'class x');
        studentMap.put(43,'class x');
        studentMap.put(49,'class y');
        studentMap.put(53,'class y');
        studentMap.put(88,'class x');
        studentMap.put(89,'class x');
        studentMap.put(100,'class x');
        //printn key and values of Map(studentMap)
        system.debug('Will print key=values'+studentMap);
        
        //print only ketset Values:
        system.debug('will print only the Keyset'+studentMap.keySet());
        
        //will display only the values not key from all the elements.
        system.debug('will display only values not key'+studentMap.values());
        
        // To get the particular element values with key.
        system.debug('To get the paerticular values'+studentMap.get(49));
        
        set<integer>keysetvariable = new set<integer>();
        
        //first way to assign a studentMap keyset values to the keyset variable
        keysetvariable=studentMap.keySet();
        
        //Another way:
        /*for(integer i:studentMap.keySet())
        {
           keySet.add(i); 
        }*/
        for(integer rollNumber:keysetvariable)
        {
            if(math.mod(rollNumber,2)==0)
            {
                studentMap.put(rollNumber,'class y');
                //system.debug('------->'+studentMap);
            }
            else if(math.mod(rollNumber,2)!=0)
            {
                studentMap.put(rollNumber,'Class x');
            }
        }
        system.debug('Odd and Even rollNumbers Assigned to Class X and Class Y'+studentMap);
    }
}