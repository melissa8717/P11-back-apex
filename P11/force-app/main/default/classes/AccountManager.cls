/**
 * @description       : method create task if an account doesnt have any order and task
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 09-10-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public class AccountManager {

/**
    * @description method create task if an account doesnt have any order and task
    * @param Set<Id> List<Account> accounts
    * @return List<Task> tasks
    **/
    public List<Task> taskAccount(List<Account> accounts){
        Map<Id,String> mapAccounts = new Map<Id,String>();
        List<Contact> resultContact = [select AccountId,Name from Contact];
        for(Contact c : resultContact){
            mapAccounts.put((Id)c.get('AccountId'), (String)c.get('Name'));
        }
        Integer numberTask = [SELECT count() FROM Task WHERE WhatId in :accounts];
        List<Task> tasks = new List<Task>();

        for(Account acc: accounts){
            if(mapAccounts.containsKey(acc.Id) && numberTask == 0){
                   tasks.add(new Task(WhatId=acc.Id,Subject='Call',Status='Not Started',
                                     Priority='Normal',IsReminderSet=true,
                                     RecurrenceInterval=5,
                                     RecurrenceRegeneratedType='RecurrenceRegenerateAfterDueDate', 
                                     ActivityDate=System.Today(),
                                     OwnerId = acc.OwnerId));
                	
                
            }
        }
		return tasks;
    }
}
