@isTest
private class CaseTriggerHandlerTest {
    
    @testSetup static void setup(){
        
        Account acct = new Account(Name='Test Account');
        insert acct;
        
        Contact con1  = new Contact(LastName='Tester1', AccountID=acct.Id);
        insert con1;
        
        Contact con2  = new Contact(LastName='Tester2', AccountID=acct.Id);
        insert con2;
        
        List<Case> caseList = new List<Case>();
		
        for(Integer i = 0 ; i < 3; i++){
             Case cs = new Case(Status='New', 
                           		Origin='Email', 
                          		Subject='Test Subject' + i, 
                           		ContactId = con1.Id, 
                           		AccountId = acct.id);            			 
            caseList.add(cs);
        }
        
         for(Integer i = 0 ; i < 4; i++){
             Case cs = new Case(Status='New', 
                           		Origin='Email', 
                          		Subject='Test Subject' + i, 
                           		ContactId = con2.Id, 
                           		AccountId = acct.id);            			 
            caseList.add(cs);
        }
        
        insert caseList;       
  }
    
    @isTest static void checkCaseStatusIsClosed(){
        
        Account acct =  [SELECT Id FROM Account WHERE Name = 'Test Account' LIMIT 1];
        Contact con1  = [SELECT Id FROM Contact WHERE LastName = 'Tester1' LIMIT 1];
        Contact con2  = [SELECT Id FROM Contact WHERE LastName = 'Tester2' LIMIT 1];
        
        Case cs1 = new Case(Status='New', 
                           Origin='Email', 
                           Subject='Test Subject 1', 
                           ContactId = con1.Id, 
                           AccountId = acct.id);
              	       
       		insert cs1;
             
        Case cs2 = new Case(Status='New', 
                           Origin='Email', 
                           Subject='Test Subject 2', 
                           ContactId = con2.Id, 
                           AccountId = acct.id);
              	       
       		insert cs2;
              
        Case conUpdate1  = [SELECT Id, Status FROM Case WHERE Subject = 'Test Subject 1' LIMIT 1];
        Case conUpdate2  = [SELECT Id, Status FROM Case WHERE Subject = 'Test Subject 2' LIMIT 1];
        System.assertEquals('Closed', conUpdate1.Status);
        System.assertEquals('Closed', conUpdate1.Status);
    }
}