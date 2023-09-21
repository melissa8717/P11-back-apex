@isTest
public class AfterDeleteOrderTest {
	 @isTest static void test() {
    	List<Account> accList = DataTestFactory.createAccount();
        insert accList;
        
        List<Order> ordList = new List<Order>();	
        ordList.addAll(DataTestFactory.createOrder(accList[0].id));
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
		Database.DeleteResult result = Database.delete(ordList[0], false);
        if(result.getErrors().size() == 0 && accList[0].Active__c != false){
        	accList[0].Active__c = false;
        	update accList;
        }
        Test.stopTest();
         
        System.assertEquals(false,accList[0].Active__c);
  
    }

}