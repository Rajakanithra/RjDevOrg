@isTest
private class OptyStageUpdateTestClass {
@isTest
    static void testInitialValue() {
        // Given
        Opportunity opp = new Opportunity();
        opp.Name = 'Test opportunity';
        opp.StageName = 'Prospecting';
        opp.CloseDate = Date.today();
        
        // When
        insert opp;
        System.debug('opp Id:' + opp.Id);
        
        // Then
        Opportunity opty = [SELECT Id, Amount FROM Opportunity WHERE Id = :opp.Id];
        System.assertEquals(0, opty.Amount, 'Initially amount should be 0');
    }
    @IsTest
    static void testStageNameChangeOnce() {
        // Given that there is an opportunity in the database already
        // and we are changing the stagename of that opportunity
        // then the amount should be incremented by 1000.
        Opportunity opp = new Opportunity();
        opp.Name = 'Test opportunity';
        opp.StageName = 'Prospecting';
        opp.CloseDate = Date.today();
        opp.Amount = 3000;
        insert opp;
        
        // When
        opp.StageName = 'Needs Analysis';
        update opp;
        
        // Then
        Opportunity opty = [SELECT Id, Amount FROM Opportunity WHERE Id = :opp.Id];
        System.assertEquals(4000, opty.Amount, '1000 should be added to existing amount value, which is 3000');
    }
    @IsTest
    static void testStageNameChangeTwice() {
        // Given that there is an opportunity already in the database
        // and we are changing the stagename of that opportunity
        // two times. Then the amount should be incremented by 2000.
        Opportunity opp = new Opportunity();
        opp.Name = 'Test opportunity';
        opp.StageName = 'Prospecting';
        opp.CloseDate = Date.today();
        opp.Amount = 3000;
        insert opp;
        
        // When
        opp.StageName = 'Needs Analysis';
        update opp;
        opp.StageName = 'Value Proposition';
        update opp;
        
        // Then
        Opportunity opty = [SELECT Id, Amount FROM Opportunity WHERE Id = :opp.Id];
        System.assertEquals(5000, opty.Amount, '2000 should be added to existing amount value, which is 3000');
    }
}