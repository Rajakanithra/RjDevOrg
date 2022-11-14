public class oppsTestClass
{
    public static void testOppMethod(List<testWrapper> testWrap)
    {
        for(testWrapper tst: testWrap)
        {
            tst.name = 'gowtham';
            tst.age = 22;
            system.debug('name----->'+tst.name);
            system.debug('age----->'+tst.age);
            
        }
    }
    public class testWrapper
    {
        public string name { get; set;}
        public integer age { get; set;}
        public testWrapper(String name, Integer age)
        {
            this.name = name;
            this.age = age;
        }
        
    }
}