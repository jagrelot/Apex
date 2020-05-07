public with sharing class LeadUtils 
{
    public static final String KEY_UNDEFINED='KEY_UNDEFINED';
    public static final String KEY_OWNED_BY_QUEUE='KEY_OWNED_BY_QUEUE';
    
    /*
     * Replaces the Lead Mentz_Key__c field with the value from the Mentz_Lead_User_Key__c
     * record matching the user-supplied Lead Mentz_Key__c field and the Mentz_Key__c field
     * on the user record. If the lead or user record are missing the Mentz_Key__c field, 
     * a Mentz_Lead_User_Key__c record with the appropriate value set to null will be looked
     * for. 
     */
    public static void SetMentzKey(List<Lead> leads)
    {
        Set<Id> userIds=new Set<Id>();
        Set<String> leadKeys=new Set<String>();
        for (Lead ld : leads) 
        {
            userIds.add(ld.OwnerId);
            leadKeys.add(ld.Mentz_Key__c!=null?ld.Mentz_Key__c:'null');
        }

        List<User> users=[select id, Mentz_Key__c from User where Id in :userIds];

        Map<Id, User> usersById=new Map<Id, User>();
        Set<String> userKeys=new Set<String>();
        for (User us : users) 
        {
            userKeys.add(us.Mentz_Key__c!=null?us.Mentz_Key__c:'null');
            usersById.put(us.Id, us);
        }

        Map<String, Mentz_Lead_User_Key__c> mlukByCompositeKey=new Map<String, Mentz_Lead_User_Key__c>();

        for (Mentz_Lead_User_Key__c mluk : [select id, Lead_Key__c, User_Key__c, Mentz_Key__c 
                                            from Mentz_Lead_User_Key__c
                                            where Lead_Key__c in :leadKeys 
                                               or User_Key__c in :userKeys])
        {
            // if the Lead__Key__c or User_Key__c field is null, this will result in the 
            // composite key containing the string literal 'null'
            mlukByCompositeKey.put(mluk.Lead_Key__c + ':' + mluk.User_Key__c, mluk);
        }

        for (Lead ld : leads) 
        {
            User us=usersById.get(ld.OwnerId);
            if (null!=us)
            {
                // if the lead or user Mentz_Key__c field is null, this will result in the 
                // composite key containing the string literal 'null'
                String compositeKey=ld.Mentz_Key__c + ':' + us.Mentz_Key__c;
                Mentz_Lead_User_Key__c mluk=mlukByCompositeKey.get(compositeKey);
                if (null==mluk)
                {
                    ld.Mentz_Key__c=KEY_UNDEFINED;
                }
                else
                {
                    ld.Mentz_Key__c=mluk.Mentz_Key__c;
                }
            }
            else 
            {
                ld.Mentz_Key__c=KEY_OWNED_BY_QUEUE;
            }
        }
    }
}