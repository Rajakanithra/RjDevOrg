public class CynosureGenericUtility {
    public static CynoParent getRecordWithMoreSalary(CynoParent firstRecord, CynoParent secondRecord) {
        System.debug('@@@@@@ 4 firstRecord @@@@@@@ '+firstRecord);
        System.debug('@@@@@@ 5 secondRecord @@@@@@@ '+secondRecord);

        if(firstRecord.yearSalary == NULL || firstRecord.yearSalary == 0) {
            System.debug('@@@@@@ 8 @@@@@@@ ');
            return secondRecord;
        }
        if(secondRecord.yearSalary == NULL || secondRecord.yearSalary ==0){
            System.debug('@@@@@@ 9 @@@@@@@ ');
            return firstRecord;
        }
        if(firstRecord.yearSalary > secondRecord.yearSalary) {
            System.debug('@@@@@@ 10 @@@@@@@ ');
            return firstRecord;
        }
        System.debug('@@@@@@ 11 @@@@@@@ ');
        return secondRecord;
    }
    public static CynoAddress getNonUniqueAddress(CynoAddress currAddress, CynoAddress permAddress) 
    {
        if(currAddress != null && permAddress != null)
        {
            if(permAddress != currAddress)
            {
                return permAddress;
            }
            else
            {
                return currAddress;
            }
        }
        
        return null;
    }
    public static CynoAddress getUniqueAddress(CynoAddress currAddress, CynoAddress permAddress) 
    {
        if(currAddress != null && permAddress != null)
        {
            if(permAddress == currAddress)
            {
                return permAddress;
            }
            else
            {
                return currAddress;
            }
        }
        
        return null;
    }
    public static CynoAddress removeAddressIfPermIsEmpty( CynoAddress permAddress) 
    {
        if(permAddress == null)
        {
            return null;
            
        }
        
        return permAddress;
    }
    public static CynoAddress removeAddressIfCurrIsEmpty( CynoAddress currAddress) 
    {
        if(currAddress == null)
        {
            return null;
            
        }
        
        return currAddress;
    }
}