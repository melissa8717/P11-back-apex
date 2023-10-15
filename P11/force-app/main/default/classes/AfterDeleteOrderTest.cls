@isTest
public class AfterDeleteOrderTest {
	 @isTest static void test() {
    	List<Account> accList = DataTestFactory.createAccount(101,false);
        insert accList;
        
        List<Order> ordList = new List<Order>();
         for(Integer i=0; i<1;i++){
       		ordList.addAll(DataTestFactory.createOrder(1,false, accList[i].id));
         }
        insert ordList;
         
        Product2 product = DataTestFactory.createProduct();
        insert product;
        
        PriceBookEntry price = DataTestFactory.createPrice(product.id);
        insert price;
        
        List<OrderItem> ordItemList = new List<OrderItem>();
        for(Integer j=0; j<ordList.size();j++){
          ordItemList.addAll(DataTestFactory.createOrderItem(ordList[j].id,product.id, price.id));
        }
         
        insert ordItemList;
         
        Test.startTest();
        Integer deleteSize = 0;
        for(Integer i=0;i<ordList.size();i++){
             Database.DeleteResult result = Database.delete(ordList[i], true);
             deleteSize = result.getErrors().size();
            
        }
        for(Integer i=0;i<accList.size();i++){

             if( deleteSize == 0 && accList[i].Active__c != false){
                    accList[i].Active__c = false;
                    
              }
        }
        update accList;
         
        Test.stopTest();
         
        Assert.areEqual(0, deleteSize);
        
        List<Account> accInactive = [SELECT id Active__c FROM Account WHERE Active__c = false];
        Assert.areEqual(101, accInactive.size();
  
    }

}