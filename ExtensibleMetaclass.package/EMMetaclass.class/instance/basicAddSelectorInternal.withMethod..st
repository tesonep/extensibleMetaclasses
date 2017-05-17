adding/removing methods
basicAddSelectorInternal: selector withMethod: compiledMethod.
	methodDict at: selector put: compiledMethod.
	
	compiledMethod methodClass: self.
	compiledMethod selector: selector.