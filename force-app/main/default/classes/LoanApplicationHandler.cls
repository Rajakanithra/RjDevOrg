public with sharing class LoanApplicationHandler {
    @AuraEnabled
    public static object getPersonalLoanDetails(Object customer){
        try{
            if(customer != null)
            {
              System.debug(customer);
            }
           
            return customer;
        }
        catch (Exception e)
        {
            System.debug(e.getMessage());
        }
        return customer;
    }
}