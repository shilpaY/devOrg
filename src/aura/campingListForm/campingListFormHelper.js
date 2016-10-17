({
	validateCampingItemForm: function(component) {

    	var validItem = true;
        var nameField = component.find("campingitemname");
        var campingname = nameField.get("v.value");
        if ($A.util.isEmpty(campingname)){
            validItem = false;
            nameField.set("v.errors", [{message:"Camping Item name can't be blank."}]);
        } else {
            nameField.set("v.errors", null);
        }
        var quantityField = component.find("quantity");
        var campingQuantity = quantityField.get("v.value");
        if ($A.util.isEmpty(campingQuantity) || isNaN(campingQuantity) || (campingQuantity <= 0)) {
            validItem = false;
            quantityField.set("v.errors", [{message:"Camping Item quantity can't be blank."}]);
        } else {
            quantityField.set("v.errors", null);
        }
		var priceField = component.find("price");
        var campingPrice = priceField.get("v.value");
    	if ($A.util.isEmpty(campingPrice) || isNaN(campingPrice) || (campingPrice <= 0.0)){
            validItem = false;
            priceField.set("v.errors", [{message:"Camping Item price can't be blank."}]);
        } else {
            priceField.set("v.errors", null);
        }
        return(validItem);
	},
    createItem: function(component, citem) {
    	var cEvent = component.getEvent("addItem");
    	cEvent.setParams({ "item": citem });
    	cEvent.fire();
        component.set("v.newItem",{ 'sobjectType': 'Camping_Item__c',
                    'Name': '',
                    'Quantity__c': 0,
                    'Price__c': 0,
                    'Packed__c': false });
	}

})