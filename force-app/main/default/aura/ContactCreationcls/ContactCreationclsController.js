({
	dosave : function(component, event, helper)
    {
	    var  action=component.get("c.Contactcreation");
        var contactList=component.get("v.contactList");
        action.setParams({'conobj':component.get('v.contobj')});
        action.setCallback(this,function(data)
                           {
                               var state=data.getState();
                               if(state=="success")
                               {
                                   var name=data.getReturnValue();
                                   alert("hello"+name);
                                   
                               }
                               //component.set('v.contid',data.getReturnValue())
                               contactList.splice(0,0,component.get('v.contobj'));
                               component.set("v.contactList",contactList);
                           });
        var toastEvent = $A.get("e.force:showToast");
    toastEvent.setParams({
        "title": "Success!",
        "message": "The record has been updated successfully."
    }); 
         //$A.get('e.force:refreshView').fire();
    toastEvent.fire();
       
         
        $A.enqueueAction(action);
        
	},
    showContacts : function(component, event, helper)
    {
        var action=component.get("c.retrieveContact");
        action.setCallback(this,function(data)
                           {
                               component.set('v.contactList',data.getReturnValue())
                           });
        $A.enqueueAction(action);
    }
})