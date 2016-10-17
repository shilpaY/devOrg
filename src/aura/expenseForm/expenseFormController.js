({
	clickCreateExpense: function(component, event, helper) {
    	if(helper.validateExpenseForm(component)){
        // Create the new expense
        	var newExpense = component.get("v.newExpense");
            //console.log("NewExpenseInFormController", newExpense);
        	helper.createExpense(component, newExpense);
    	}
	}
})