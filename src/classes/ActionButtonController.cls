public class ActionButtonController {
    
    public class ActionButtonControllerException extends Exception {}
    
    @AuraEnabled
    public static String getOrderActionButtonSetting(Id recordId) {
        String actionSettingJSON;
        Order order = [SELECT id, Status FROM Order WHERE id = :recordId];
        String orderStatus = order.status;

        Order_Action_Setting__mdt[] actionSettingList = [SELECT Id, Order_Status__c, Cancel_Order_Action_Allowed__c, Send_Order_Return_Action__c FROM Order_Action_Setting__mdt WHERE Order_Status__c = :orderStatus];
        if(actionSettingList.size() > 0) {
            actionSettingJSON = JSON.serialize(actionSettingList[0]);
        }
        
        return actionSettingJSON;
    }
}