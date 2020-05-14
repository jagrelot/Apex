/**
 * Author: Jose Agrelot
 * Description: Retrieve sample data from static resource and use to prrpopulate via StaticResourceCSV.parseAndInsert();
 * Resources: static resource for Account
 * Referenced: automatically executed when dev sandboxes are created or refreshed.
 */
public with sharing class StaticResourceCSV {
  
        /**
         * Description: create and insert account data from static resource sample data CSV file
         */
        public static void parseAndInsert() {

            Blob csvFile    = [SELECT body FROM StaticResource WHERE name = 'Account'].body;
            String csvData  = csvFile.toString();
            List<String> rowList = csvData.split('\n');
            Map<String,Account> accountMap = new Map<String,Account>();
            for(Integer i=1 ; i<rowList.size(); i++) {
                Account a = new Account();
                List<String> fieldList = rowList[i].split(',');
                a.name = fieldList[1];
                accountMap.put(fieldList[0],a);
            }
            
            insert accountMap.values();

            csvFile =  [SELECT body FROM StaticResource WHERE name = 'Contact'].body;
            csvData = csvFile.toString();
            rowList = csvData.split('\n');
            Map<String,Contact> contactMap = new Map<String,Contact>();
            for(Integer i=1 ; i<rowList.size(); i++) {
                Contact c = new Contact();

                List<String> fieldList = rowList[i].split(',');
                c.FirstName = fieldList[1];
                c.LastName  = fieldList[2];
                c.AccountId = accountMap.get(fieldList[0]).ID;
                contactMap.put(fieldList[0],c);
            }

            insert contactMap.values();
    }
}
