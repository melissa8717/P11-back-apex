public class DataTestFactory {
	public static List<Account> createAccount(Integer itAcc, Boolean insertAcc){
        List<Account> accounts = new List<Account>();
        for(Integer i=0;i<itAcc;i++){
            accounts.add(new Account(name='Account'+i)); 
        }
        return accounts;
    }
    
    public static List<Task> createTask(Integer itTask, Boolean insertTask, Id accountId, Id ownerId){
    	List<Task> tasks = new List<Task>();
        for(Integer i=0;i<itTask;i++){
            tasks.add(new Task(WhatId=accountId,Subject='Call',Status='Not Started',
                                     Priority='Normal',IsReminderSet=true,
                                     RecurrenceInterval=5,
                                     RecurrenceRegeneratedType='RecurrenceRegenerateAfterDueDate', 
                                     OwnerId = ownerId, ActivityDate=system.today()));
        }
        return tasks;
    }

    
    public static Product2 createProduct() {
        Product2 p = new Product2();
        p.Name = ' Test Product ';
        p.Description='Test Product Entry 2';
        p.productCode = 'ABCD';
        p.isActive = true;
        return p;
    }
    
    public static PricebookEntry createPrice(Id product2Id){
        PricebookEntry standardPrice = new PricebookEntry();
        standardPrice.Pricebook2Id = Test.getStandardPricebookId();
        standardPrice.Product2Id = product2Id;
        standardPrice.UnitPrice = 1;
        standardPrice.IsActive = true;
        standardPrice.UseStandardPrice = false;
        return standardPrice;
    }
    public static List<Order> createOrder(Integer itOrd, Boolean insertOrd, Id accountId){
        List<Order> orders = new List<Order>();
        for(Integer i=0;i<itOrd;i++){
            orders.add(new Order(AccountId = accountId, Status='Draft',Pricebook2Id= Test.getStandardPricebookId(),Name='Order'+i,EffectiveDate=Date.Today()));
        }
        return orders;
    }
    public static List<OrderItem> createOrderItem(Id orderId,Id product2Id, Id standardpriceId){
        List<OrderItem> orderItems = new List<OrderItem>();
        for(Integer i=0;i<20;i++){
            orderItems.add(new OrderItem(Product2id = product2Id,PriceBookEntryId=standardpriceId, Quantity =1, OrderId = orderId, UnitPrice=1000));
  
        }
        return orderItems;
    }
    
}