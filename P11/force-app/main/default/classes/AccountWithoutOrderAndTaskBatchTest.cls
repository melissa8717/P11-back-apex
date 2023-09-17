/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 09-17-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
@isTest
public class AccountWithoutOrderAndTaskBatchTest {
	@testSetup
    static void setup(){
    
        List<Account> accList = DataTestFactory.createAccount();
        insert accList;
        accList[0].Active__c ='false';
        update accList[0];
        
    }
    @isTest static void test() {
		List<Account> accounts = [SELECT Id, Active__c,OwnerId FROM Account];
        Id accountId = accounts[0].id;
        Integer orders = [SELECT count() FROM Order WHERE AccountId=:accountId];
		Integer tasks = [SELECT count() FROM Task WHERE WhatId=:accountId];
       
        Test.startTest();
        AccountWithoutOrderAndTaskBatch bt = new AccountWithoutOrderAndTaskBatch();
        Id batchId = Database.executeBatch(bt);
		List<Task> taskList = new List<Task>();

         String CRON_EXP = '0 0 0 15 3 ? 2042';

        if(orders == 0 && tasks ==0){
            // Schedule the test job

        	String jobId = System.schedule('ScheduledApexTest',
            CRON_EXP,
            new AccountScheduleBatch());
        	taskList.addAll(DataTestFactory.createTask(accountId, accounts[0].OwnerId));       
        }
        
        insert taskList;
        
		Test.stopTest();
        Integer tasksAfter = [SELECT count() FROM Task WHERE WhatId=:accountId];

        System.assertEquals(1,tasksAfter);

         
    }
}