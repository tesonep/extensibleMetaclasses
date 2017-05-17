adding/removing methods
basicAddSelector: selector withMethod: compiledMethod 
	myMethodDict at: selector put: compiledMethod.
	self basicAddSelectorInternal: selector withMethod: compiledMethod.
