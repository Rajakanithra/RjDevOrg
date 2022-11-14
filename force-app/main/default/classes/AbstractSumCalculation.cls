public class AbstractSumCalculation extends AbstractSum {
    public override void sumOfTwo(integer num1,integer num2){
        integer result;
        result=num1+num2;
        system.debug('The Result of Sum Of Two Number is:'+result);
    }
    public override void sumOfThree(integer num1,integer num2,integer num3){
        integer result;
        result=num1+num2+num3;
        system.debug('The Result of Sum Of Three Number is:'+result);
    }
    public override void multipleOfTwo(integer num1,integer num2){
        integer result;
        result=num1*num2;
        system.debug('The Multiplication of two number is:'+result);
    }
    public override void divisionOfTwo(integer num1,integer num2){
        integer result;
        result=num1/num2;
        system.debug('The division of two number is:'+result);
        try{
            
            if(math.mod(result,2)==0)
            {
                system.debug('After odd/even The resultant number is Even'+result);
            }
            else
            {
                system.debug('After odd/even The resultant number is Odd'+result);
            }
        }
        catch(Exception e)
        {
            System.debug('The following exception has occurred: ' + e.getMessage());
        }
        
    }  
}