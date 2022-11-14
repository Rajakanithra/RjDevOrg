public class RecordOwnerNameToField {
    public static void main(List<Account> triggernew){
       Set<Id>ownerid = new Set<Id>();
        for(Account acc : triggernew){
            ownerid.add(acc.ownerid);
        }
        List<User> accList =[select id,name from User where id in:ownerid];
        for(Account acc:triggernew){
            if(acc.OwnerId != Null){
                acc.Description = acclist[0].Name;
            }
        }
    }
}