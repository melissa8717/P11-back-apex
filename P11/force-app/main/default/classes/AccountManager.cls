/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 09-10-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public class AccountManager {
    public List<Task> taskAccount(List<Account> accounts){
                  //select WhatId from Task Where 
        Map<Id,String> mapAccounts = new Map<Id,String>();
        List<Contact> resultContact =null;
        resultContact = [select AccountId,Name from Contact];
        for(Integer I=0;i<resultContact.size();i++){
            mapAccounts.put((Id)resultContact[i].get('AccountId'), (String)resultContact[i].get('Name'));
        }
        Integer numberTask = [SELECT count() FROM Task WHERE WhatId in :accounts];
        List<Task> tasks = new List<Task>();

        for(Account acc: accounts){
            if(mapAccounts.containsKey(acc.Id)){
                if(numberTask == 0 || numberTask == null){
                   tasks.add(new Task(WhatId=acc.Id,Subject='Call',Status='Not Started',
                                     Priority='Normal',IsReminderSet=true,
                                     RecurrenceInterval=5,
                                     RecurrenceRegeneratedType='After due date', 
                                     OwnerId = acc.OwnerId));
                }	
                
            }
        }
		return tasks;
    }
}