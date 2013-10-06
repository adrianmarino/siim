/* ------------------------------------------------------------------------- */
/* Classes used for polulate select tags selated with a parent select tag    */
/* ------------------------------------------------------------------------- */
/* 
	ParentSelectTag Class...
*/
function ParentSelectTag(aSelectId, anAllValue) {
	/* Attributes... */
	this.selectId = aSelectId;
	this.allValue = anAllValue;

	this.tag = function() {
		return $("#" + this.selectId);
	};

	this.selectedValue = function() {
		return this.tag().val();
	};

	this.isSelectedValue = function(aValue) {
		return aValue == this.selectedValue();
	};

	this.allIsSelected = function() {
		return this.allValue == this.selectedValue();
	};
}

/* 
	RelatedSelectTag Class...
*/
function RelatedSelectTag(aSelectId, anAllOption) {
	/* Attributes... */
	this.allOption = anAllOption;
	this.select_id = aSelectId;
	this.allOptions = new Array();

	/* Methods... */
	this.addOption = function(aParentSelectValue, aRelatedSelectLabel, aRelatedSelectId) {
		this.allOptions.push(new Array(aParentSelectValue, aRelatedSelectLabel, aRelatedSelectId));
	};

	/* Methods... */
	this.tag = function() { 
		return $("#" + this.select_id);
	};

	this.clear = function() {
		this.tag().find('option').remove();
	};

	this.options = function() {
		return tag().options;
	};

	this.addNewOption = function(a_value, a_label) {
		this.tag().append("<option value=\"" + a_value + "\">" + a_label + "</option>");
	};

	this.addNewAllOption = function() {
		this.addNewOption(this.allOption[0], this.allOption[1]);
	};

	this.addOptionsFrom = function(aParent) {
		a_this = this;
		this.allOptions.forEach( function(an_option) {
			if (aParent.allIsSelected() || aParent.isSelectedValue(an_option[0])) {
				a_this.addNewOption(an_option[2], an_option[1]);
			}
		});
	};

	this.updateFrom = function(aParent) {
		this.clear();
		this.addNewAllOption();
		this.addOptionsFrom(aParent);
	};

	this.updateInOnChangeFrom = function(aParent) {
		a_this = this;
		aParent.tag().change(function(){a_this.updateFrom(aParent)});
	};

	this.selectOptionWithValue = function(aValue) {
		if(aValue.length > 0)
			this.tag().val(aValue);
	}
}

