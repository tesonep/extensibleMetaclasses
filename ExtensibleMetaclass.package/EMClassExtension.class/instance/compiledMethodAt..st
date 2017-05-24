recompilation
compiledMethodAt: aSelector
	^ self methodDict at: aSelector ifAbsent: [ self hiddenMethodDict at: aSelector ]