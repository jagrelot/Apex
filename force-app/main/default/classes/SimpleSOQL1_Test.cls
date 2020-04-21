@isTest
private class SimpleSOQL1_Test 
{
    @isTest
    static void getContactTest()
    {
        Contact kabCont=new Contact(FirstName='Keir', 
                                 LastName='Bowden');

        insert kabCont;

        SimpleSOQL1 ss1=new SimpleSOQL1();
        Contact cont=ss1.getContact(kabCont.Id);

        System.assertEquals(kabCont.FirstName, cont.FirstName, 'First name should equal ' + kabCont.FirstName);
        System.assertEquals(kabCont.LastName, cont.LastName, 'Last name should equal ' + kabCont.LastName);
    }

    @isTest
    static void getCEOsTest()
    {
        Integer ceoCount=0;

        List<Contact> contacts=new List<Contact>();
        for (Integer idx=0; idx<50; idx++)
        {
            Contact cont=new Contact(FirstName='First ' + idx,
                                     LastName='Last + ' + idx);

            if (Math.random()>0.5)
            {
                ceoCount++;
                cont.Title='CEO';
            }
            else 
            {
                cont.Title='Developer';
            }

            contacts.add(cont);
        }

        insert contacts;

        SimpleSOQL1 ss1=new SimpleSOQL1();
        List<Contact> ceos=ss1.getCEOs();

        System.assertEquals(ceoCount, ceos.size(), 'Should be ' + ceoCount + ' records with the title of \'CEO\'');

        for (Contact ceo : ceos)
        {
            System.assertEquals('CEO', ceo.Title, 'Record for ' + ceo.FirstName + ' ' + ceo.LastName + ' does not have the title of \'CEO\'');
            System.assertNotEquals(null, ceo.FirstName, 'First name must be included in the results');
            System.assertNotEquals(null, ceo.LastName, 'Last name must be included in the results');
        }
    }

    @isTest
    static void getYoungestTest()
    {
        Date youngestDOB=Date.newInstance(2050, 1, 1);

        List<Contact> contacts=new List<Contact>();
        for (Integer idx=0; idx<50; idx++)
        {
            Integer days=(Math.random()*10000).intValue();

            Date dob=System.today().addDays(-days);
            if (dob<youngestDOB)
            {
                youngestDOB=dob;
            }
            
            Contact cont=new Contact(FirstName='First ' + idx,
                                     LastName='Last + ' + idx,
                                     BirthDate=dob);

            contacts.add(cont);
        }

        insert contacts;

        SimpleSOQL1 ss1=new SimpleSOQL1();
        Contact youngest=ss1.getYoungest();

        System.assertEquals(youngestDOB, youngest.BirthDate, 'Date of birth should be ' + youngestDOB);
    }

    @isTest
    static void getContactsForAccountsTest()
    {
        List<Account> accounts=new List<Account>();
        for (Integer idx=0; idx<10; idx++)
        {
            Account acc=new Account(Name='Account ' + idx);

            accounts.add(acc);
        }

        insert accounts;

        List<Contact> contacts=new List<Contact>();
        List<Integer> contactCountForAccount=new List<Integer>();

        for (Integer idx=0; idx<10; idx++)
        {
            Integer contCount=(Math.random() * 50).intValue();
            contactCountForAccount.add(contCount);

            for (Integer contIdx=0; contIdx<contCount; contIdx++)
            {
                Contact cont=new Contact(FirstName='First ' + idx + ' - ' + contIdx,
                                         LastName='Last ' + idx + ' - ' + contIdx,
                                         AccountId=accounts[idx].id);
                contacts.add(cont);
            }
        }

        insert contacts;

        Integer contactCount=0;
        List<Account> accs=new List<Account>();
        Map<Id, Integer> countsByAccountId=new Map<Id, Integer>();
        for (Integer idx=0; idx<5; idx++)
        {
            accs.add(accounts[idx*2]);
            Integer cCount=contactCountForAccount[idx*2];
            contactCount+=cCount;
            countsByAccountId.put(accs[idx].Id, cCount);
        }

        SimpleSOQL1 ss1=new SimpleSOQL1();
        List<Contact> contactsForAccounts=ss1.getContactsForAccounts(accs);

        System.assertEquals(contactCount, contactsForAccounts.size(), 'Should be ' + contactCount + ' contacts');

        Map<Id, Integer> candCountsByAccountId=new Map<Id, Integer>();
        for (Contact cont : contactsForAccounts)
        {
            Integer countForAccount=candCountsByAccountId.get(cont.AccountId);
            if (null==countForAccount)
            {
                countForAccount=0;
            }

            countForAccount++;

            candCountsByAccountId.put(cont.AccountId, countForAccount);
        }

        for (Id accId : candCountsByAccountId.keySet())
        {
            Integer candCount=candCountsByAccountId.get(accId);
            Integer origCount=countsByAccountId.get(accId);

            System.assertEquals(origCount, candCount, 'Account id ' + accId + ' should have ' + origCount + ' contacts, not ' + candCount);
        }
    }

    @isTest
    static void getFieldsForContactTest()
    {
        Contact cont=new Contact(FirstName='Keir', 
                                 LastName='Bowden',
                                 Title='CEO', 
                                 Salutation='Mr',
                                 DoNotCall=true);

        insert cont;

        SimpleSOQL1 ss1=new SimpleSOQL1();

        Contact candCont=ss1.getFieldsForContact(cont.Id, 'FirstName', 'LastName');
        System.assertEquals(cont.FirstName, candCont.FirstName, 'First name should be ' + cont.FirstName);
        System.assertEquals(cont.LastName, candCont.LastName, 'Last name should be ' + cont.LastName);

        candCont=ss1.getFieldsForContact(cont.Id, 'FirstName', 'Title');
        System.assertEquals(cont.FirstName, candCont.FirstName, 'First name should be ' + cont.FirstName);
        System.assertEquals(cont.Title, candCont.Title, 'Title should be ' + cont.Title);

        candCont=ss1.getFieldsForContact(cont.Id, 'DoNotCall', 'Salutation');
        System.assertEquals(cont.DoNotCall, candCont.DoNotCall, 'DoNotCall should be ' + cont.DoNotCall);
        System.assertEquals(cont.Salutation, candCont.Salutation, 'Salutation should be ' + cont.Salutation);
    }
}
