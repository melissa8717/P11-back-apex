/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 09-10-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
trigger OrderTrigger on Order (after delete) {
	if (Trigger.isDelete) {
        OrderHandler instance = new OrderHandler();
        instance.verifyOrder(trigger.old);
    }
}