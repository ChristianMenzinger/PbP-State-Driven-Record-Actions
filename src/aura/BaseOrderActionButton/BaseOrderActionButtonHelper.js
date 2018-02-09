({
    getActionSettingById: function (component) {
        component.set("v.isButtonActionAvailable", false);
        
        var action = component.get("c.getOrderActionButtonSetting");
        var actionAPIName = component.get("v.actionAPIName");
        action.setParams({ "recordId" : component.get("v.recordId") });
        action.setCallback(this, function(response) {

            var state = response.getState();
            if (state === "SUCCESS") {
                               
                var responseData = JSON.parse(response.getReturnValue());
                debugger;
                if(!$A.util.isEmpty(responseData)) {
                    component.set("v.isButtonActionAvailable", $A.util.getBooleanValue(responseData[actionAPIName]));
                }
                
            }
            else if (state === "INCOMPLETE" || state === "ERROR") {
                alert("Error");
            }
        });
        
        $A.enqueueAction(action);
    }
})