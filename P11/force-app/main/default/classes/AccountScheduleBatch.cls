/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 09-10-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public class AccountScheduleBatch implements Schedulable {
    public void execute(SchedulableContext ctx) {
        AccountScheduleBatch schedule = new AccountScheduleBatch();
		// Seconds Minutes Hours Day_of_month Month 
		// Day_of_week: 2 : "Monday" and "#1" means every 1st week
		String sch = '0 0 00 ? * 2#1';
		String jobID = System.schedule('AccountBatch', sch, schedule);
        AccountWithoutOrderAndTaskBatch batch = new AccountWithoutOrderAndTaskBatch();
        Database.executeBatch(batch);
    
    }
}