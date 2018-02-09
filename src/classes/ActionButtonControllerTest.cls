@isTest
public class ActionButtonControllerTest {
	@isTest
    public static void testMetadata () {
        Account account = new Account();
        account.Name = 'Salesforce';
        insert account;
        Order order = new Order();
        order.Status = 'Order Entry';
        order.AccountId = account.Id;
        order.EffectiveDate = Date.newInstance(2018, 01, 01);
        insert order;
        String actionSettingsJSON = ActionButtonController.getOrderActionButtonSetting(order.Id);
        System.assertNotEquals(actionSettingsJSON, null);
    }
}