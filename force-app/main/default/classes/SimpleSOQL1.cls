public with sharing class SimpleSOQL1 {
  /**
        Queries the Contact record associated with the ID passed to the contId parameter.
        @param contId : Contact Id to query against.
        @return Contact record
    */
  public Contact getContact(Id contId) {
    if (
      contId != null &&
      String.valueOf(contId.getSobjectType()).equalsIgnoreCase('Contact')
    ) {
      return [SELECT Id, FirstName, LastName FROM Contact WHERE Id = :contId];
    }

    return null;
  }

  /**
        Queries for Contacts that have a Title of 'CEO'
        @return List of Contact records
    */
  public List<Contact> getCEOs() {
    return [
      SELECT Id, FirstName, LastName, Title
      FROM Contact
      WHERE Title = 'CEO'
    ];
  }

  /** 
        Queries for youngest Contact record
        @return Contact record
    */
  public Contact getYoungest() {
    return [SELECT Id, Birthdate FROM Contact ORDER BY Birthdate ASC LIMIT 1];
  }

  /** 
        Queries Contacts associated to the Accounts
        @param accounts
        @return List of Contacts for each Account
    */
  public List<Contact> getContactsForAccounts(List<Account> accounts) {
    if (!accounts.isEmpty()) {
      return [SELECT Id, accountId FROM Contact WHERE accountId IN :accounts];
    }

    return null;
  }

  /** 
        Queries Contact Id with fields passed in method signature
        @param accoucontId
        @param field1 existing field on Contact object
        @param field2 existing field on Contact object 
        @return Contact with specified field arguments
    */
  public Contact getFieldsForContact(Id contId, String field1, String field2) {
    String errMessage;

    if (contId != null && field1 != null && field2 != null && String.valueOf(contId.getSobjectType()).equalsIgnoreCase('Contact')) {
      if (!Contact.getSObjectType().getDescribe().fields.getMap().keySet().contains(field1.toLowerCase())) {
        errMessage ='The field ' + field1 +' does not exist on the Contact objcet';
      }
      if (!Contact.getSObjectType().getDescribe().fields.getMap().keySet().contains(field2.toLowerCase())) {
        errMessage ='The field ' + field2 +' does not exist on the Contact objcet';
      }

      if (!String.isEmpty(errMessage)) {
        try {

          return Database.query('SELECT ' + field1 + ', ' + field2 +' FROM Contact  WHERE Id = \'' + contId + '\' LIMIT 1');

        } catch (QueryException e) {
            e.setMessage(errMessage);
          
        } catch(Exception e) {
            System.debug('Exception caught: ' + e.getMessage());    
        }
      }
    }
    return null;
  }
}
