adding/removing methods
addSelectorSilently: selector withMethod: compiledMethod
	self basicAddSelector: selector withMethod: compiledMethod.
	self registerLocalSelector: selector.
	self rebuildMethodDictionary
