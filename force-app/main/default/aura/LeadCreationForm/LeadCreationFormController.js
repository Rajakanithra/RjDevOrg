({
   cancelDialog : function(component, helper) {      
        var home  = $A.get("e.force:navigateToObjectHome");
        home .setParams({
            "scope": "Lead"
        });
        home .fire();
    }
})