@IsTest
private class OpportunityTriggerTrainingRohitTestclass {
    @IsTest
    public static void testIfInsertOpoortunityAmountShouldNotUpdate(){
        Opportunity opp= new Opportunity();
        opp.Name='TestRajaMonday';
        opp.StageName='Prospecting';
        opp.CloseDate=system.today()+10;
        opp.Amount = 0;
        insert opp;
        
        OpportunityChildren__c child = new OpportunityChildren__c();
        child.Name='TestTodayMonday';
        child.Opportunity__c = opp.id;
        child.Amount__c = 0;
        insert child;
        
        OpportunityChildren__c result = [select id,Name,Amount__c from OpportunityChildren__c where Opportunity__c =:opp.Id];
        system.assertEquals(0, result.Amount__c);
    }
@IsTest
    public static void testIfOppAmountHasChangedOrNot(){
        Opportunity opp = new Opportunity();
        opp.Name='RajamanickamTestSatday';
        opp.StageName='Prospecting';
        opp.CloseDate=system.today();
        insert opp;
        system.debug('......'+opp);
        OpportunityChildren__c child = new OpportunityChildren__c();
        child.Name='testsatday';
        child.Opportunity__c = opp.id;
        insert child;
        
        opp.Amount = 100;
        update opp;
        
        OpportunityChildren__c optychild = [select id,Name,Amount__c from OpportunityChildren__c where Opportunity__c =: opp.Id];
        system.assertEquals(0, optychild.Amount__c);
        
        
    }  
    @IsTest
    public static void TestAmountShouldNotUpdateIfNameHasChanged(){
        Opportunity opp = new Opportunity();
        opp.Name='RajaTestToday1';
        opp.StageName='Prospecting';
        opp.CloseDate = system.today()+10;
        opp.Amount = 0;
        insert opp;
        
        OpportunityChildren__c child = new OpportunityChildren__c();
        child.Name='Rajatest1today';
        child.Opportunity__c = opp.Id;
        child.Amount__c=0;
        insert child;
        
        opp.name='RajaTestMonday';
        update opp;
        
        OpportunityChildren__c result = [select id,Amount__c from OpportunityChildren__c where Opportunity__c =:opp.Id ];
        system.assertEquals(0,result.Amount__c);
    }
    @IsTest
    public static void testShouldIncrementChildAmountBy200ForMultipleChildren(){
        Opportunity opp = new Opportunity();
        opp.Name = 'TestOppTodayRaja';
        opp.StageName = 'Prospecting';
        opp.CloseDate = system.today()+10;
        //opp.Amount = 100;
        system.debug('opp amount'+opp.Amount);
        insert opp;
        system.debug('opp amount'+opp.Amount);
        
        List<OpportunityChildren__c> childList = new List<OpportunityChildren__c>();
        OpportunityChildren__c child = new OpportunityChildren__c();
        child.Name = 'Testchildopp';
        child.Opportunity__c = opp.Id;
        childList.add(child);
        
        OpportunityChildren__c child1 = new OpportunityChildren__c();
        child1.Name = 'Testchildopp1';
        child1.Opportunity__c = opp.Id;
        childList.add(child1);
        
        OpportunityChildren__c child2 = new OpportunityChildren__c();
        child2.Name = 'Testchildopp2';
        child2.Opportunity__c = opp.Id;
        childList.add(child2);
        
        insert childList;
        system.debug('Child List is'+childList);
        
        opp.Amount = 100;
        update opp;
        
        List<OpportunityChildren__c> result = [select id,Amount__c from OpportunityChildren__c where Opportunity__c =:opp.Id ];
        system.assertEquals(200, result.get(0).Amount__c);
        system.assertEquals(200, result.get(1).Amount__c);
        }
    @IsTest
    static void testShouldIncrementChildAmountForMultipleOpportunities() {
       List<Opportunity>oppList = new List<Opportunity>();
        Opportunity opp1 = new Opportunity();
        opp1.Name ='RajaTestTuesday';
        opp1.StageName ='Prospecting';
        opp1.CloseDate =system.today()+5;
        oppList.add(opp1);
        
        Opportunity opp2 = new Opportunity();
        opp2.Name='RajaTestTuesday1';
        opp2.StageName ='Prospecting';
        opp2.CloseDate = system.today()+5;
        oppList.add(opp2);
        insert oppList;
        
        List<OpportunityChildren__c> childList = new List<OpportunityChildren__c>();
        OpportunityChildren__c child = new OpportunityChildren__c();
        child.Name = 'Testchildoppfirst';
        child.Opportunity__c = opp1.Id;
        childList.add(child);
        
        OpportunityChildren__c child1 = new OpportunityChildren__c();
        child1.Name = 'Testchildoppsecond';
        child1.Opportunity__c = opp1.Id;
        childList.add(child1);
        
        OpportunityChildren__c child2 = new OpportunityChildren__c();
        child2.Name = 'Testchildoppthird';
        child2.Opportunity__c = opp2.Id;
        childList.add(child2);
        
        OpportunityChildren__c child3 = new OpportunityChildren__c();
        child3.Name = 'Testchildoppfour';
        child3.Opportunity__c = opp2.Id;
        childList.add(child3);
        
        insert childList;
        
        List<Opportunity> newOppty =[select id,Name from Opportunity where Name='RajaTestTuesday' AND createdDate=TODAY];
        for(Opportunity opp:newOppty){
            opp.Amount = 100;
            
        }
        update newOppty;
        List<OpportunityChildren__c> result = [select id,Amount__c from OpportunityChildren__c where Opportunity__c =:oppList];
        system.assertEquals(200, result.get(0).Amount__c);
        system.assertEquals(200, result.get(1).Amount__c);
        
    }
    @IsTest
    public static void testOpportunityNameInAccount(){
        
        Account accList = new Account();
        accList.Name='TestAccountWednesday';
        
        insert accList;
        
        List<Opportunity>optyList = new List<Opportunity>();
        Opportunity opp1 = new Opportunity();
        opp1.Name='TestWednesday';
        opp1.StageName='Prospecting';
        opp1.CloseDate=system.today()+5;
        opp1.Id = accList.Id;
        optyList.add(opp1);
        
        Opportunity opp2 = new Opportunity();
        opp2.Name='TestWednesdaytwo';
        opp2.StageName='Prospecting';
        opp2.CloseDate=system.today()+5;
        opp2.Id = accList.Id;
        optyList.add(opp2);
        
        insert optyList;
        
        Account result = [select id,Name,ListOfOpportunities__c from Account where Id =: accList.Id];
        system.assertEquals('TestWednesdayTestWednesdaytwo', result.ListOfOpportunities__c);
        
        
        
    }
}