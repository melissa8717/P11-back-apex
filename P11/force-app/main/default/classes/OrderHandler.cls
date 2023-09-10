/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 09-10-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public class OrderHandler {
    public void verifyOrder(List<Order>orders){
        List<Id>accountId = new List<Id>();
        for(Order ord: orders){
            accountId.add(ord.AccountId);
        }
        Integer numberOrder = [SELECT count() FROM Order WHERE AccountId IN :accountId];
        Account accList = [SELECT id, Active__c FROM Account WHERE Id In :accountId];
        for(Integer i =0; i<orders.size();i++){
            
            if(numberOrder == 0){
                if(accList.Active__c !='false'){
                	accList.Active__c = 'false';
                }
            }
        }
        update accList;
    }

}