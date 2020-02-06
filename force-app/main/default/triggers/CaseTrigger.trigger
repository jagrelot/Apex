/* Write a trigger that sets a case status to 'closed' if there are more than 2 
 * cases created that day associated with the same contact.
 *
 * TO BE ADDED : Also, close the case if there are more than 3 cases created on that account
 * that day.
 */

trigger CaseTrigger on Case (before insert, after insert, before update, after update, after undelete, after delete) {    
    
    if(trigger.isBefore && trigger.isInsert){
        LimitCasesPerDay.limitCasesPerDayForContact(Trigger.new);
    }
}