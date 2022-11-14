public with sharing class driverClassHandler {
    public static void DriverMethod(List<Driver__c> triggernew)
    {
        for(Driver__c dr:triggernew)
        {
            if(dr.Age__c != null)
            {
                if(dr.Age__c =='18-25')
                {
                    dr.Discount__c=10;
                }
                else if(dr.Age__c=='26-35')
                {
                    dr.Discount__c=20;
                }
                else if(dr.Age__c=='36-45')
                {
                    dr.Discount__c=30;
                }
                else if(dr.Age__c=='above 45')
                {
                    dr.Discount__c=40;
                }   
            }
            
        }
    }  
}