/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 09-10-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
global class AccountWithoutOrderAndTaskBatch implements Database.Batchable<sObject>{
    
    global Database.QueryLocator start(Database.BatchableContext info){ 
 
        return Database.getQueryLocator('SELECT Id,Name, Active__c FROM Account Where Active__c = \'false\' ');
    }
    global void execute(Database.BatchableContext info, List<Account> listAccounts){ 
       
        AccountManager instance = new AccountManager();
        List<Task> task = instance.taskAccount(listAccounts);
        insert task;
 
        
    }    
     
    global void finish(Database.BatchableContext info){     
        
    } 
 }