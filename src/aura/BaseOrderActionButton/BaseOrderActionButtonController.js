({
    onInit: function (component, event, helper) {
        helper.getActionSettingById(component);
    },
    
    onRecordUpdated: function (component, event, helper) {
        helper.getActionSettingById(component);
    }
})