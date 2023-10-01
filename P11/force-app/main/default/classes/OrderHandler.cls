public class OrderHandler {

/**
    * @description verify if an account have any order
    * @param List<Order>orders 
    * @return void
    **/
    public void verifyOrder(List<Order>orders){
        List<Id>accountId = new List<Id>();
        for(Order ord: orders){
            accountId.add(ord.AccountId);
        }
        Integer numberOrder = [SELECT count() FROM Order WHERE AccountId IN :accountId];
        List<Account> accList = [SELECT id, Active__c FROM Account WHERE Id In :accountId];
        for(Integer i =0; i<orders.size();i++){
            
            if(numberOrder == 0 && accList[i].Active__c != false){
               accList[i].Active__c = false;
            }
        }
        update accList;
    }


}