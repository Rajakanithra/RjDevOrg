({
    doInit: function(component, event, helper)
    {
        helper.getStudentObjectPicklistValues(component, 'Department__c');
        helper.getStudentObjectPicklistValues(component, 'Shoe_Design__c');
    },      
    dosave : function(component, event, helper)
    {
	var action=component.get("c.studentInfoMethod");
        var studentlist=component.get("v.studentlist");
        //action.setParams({'studobj':component.get('v.stuobj')});
        action.setParams({'studobj':component.get('v.stuobj')});
        action.setCallback(this,function(data){
                           var state=data.getState();
        					if(state=='success')
                            {
                                var name=data.getReturnValue();
                                alert('Hello'+name);
                            }
                           });
        studentlist.splice(0,0,component.get('v.stuobj'));
        component.set("v.studentlist",studentlist);
        /*var toastEvent = $A.get("e.force:showToast");
        toastEvent.setParams({
        "title": "Success!",
        "type" : 'success',
        "mode" : 'dismissible',
        "duration" : 5000,
        "message": "The record has been updated successfully."
    }); 
         toastEvent.fire();*/
    $A.enqueueAction(action);
	},
    showstudentlist : function(component, event, helper)
    {
        var action=component.get("c.retrievestudentinfo");
        action.setCallback(this,function(data)
        {
           component.set('v.studentlist',data.getReturnValue())                
                           });
        $A.enqueueAction(action);
    }
})