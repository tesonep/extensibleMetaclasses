compiling methods
handleInitializer: selector for: donor
	^ (donor compiledMethodAt: #initializeTrait) getSourceReplacingSelectorWith: selector