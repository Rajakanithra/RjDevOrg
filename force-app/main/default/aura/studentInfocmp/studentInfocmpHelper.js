({
	getStudentObjectPicklistValues : function(component, fieldnameVar) 
    {
	var action = component.get("c.getPicklistValues");
        action.setParams({
            "objectVar": component.get("v.stuobj"),
            "fieldNameVar": fieldnameVar
        });
        var opts = [];
        action.setCallback(this, function(response)
           {
            var state = response.getState();
            console.log('state '+state);
               //alert('state '+state);
            if (state == "SUCCESS")
            {
                //alert("successstate"+state);
                var allValues = response.getReturnValue();
                 
                opts.push({
                    label: "--- None ---",
                    value: ""
                });
            
                for (var i = 0; i < allValues.length; i++)
                {
                    opts.push({
                        label: allValues[i],
                        value: allValues[i]
                    });
                }
                if(fieldnameVar == "Department__c")
                {
                    component.set("v.deptValues", opts);
                    console.log("Department "+JSON.stringify(component.get("v.deptValues")));
                }    
                if(fieldnameVar == "Shoe_Design__c")
                {
                    component.set("v.shoeValues", opts);
                    console.log("Shoe Style "+JSON.stringify(component.get("v.shoeValues")));
                }      
                           
            }
               //alert("state not success"+state);
               //alert(allValues);
        });
        $A.enqueueAction(action);
	}	
                           
})