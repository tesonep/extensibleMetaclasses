adding/removing methods
basicAddSelector: selector withMethod: compiledMethod
	myMethodDict at: selector put: compiledMethod.
	compiledMethod methodClass: self.
	compiledMethod selector: selector