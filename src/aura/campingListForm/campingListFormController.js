({	    
    submitForm : function(component, event, helper) {
        if(helper.validateCampingItemForm(component)){
        	var newCItem = component.get("v.newItem");
        	helper.createItem(component, newCItem);
            
    	}
	}
})