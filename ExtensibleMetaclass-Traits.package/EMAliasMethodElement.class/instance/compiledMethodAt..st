compiling methods
compiledMethodAt: aSelector
	^ super
		compiledMethodAt:
			(aSelector = newSelector
				ifTrue: [ oldSelector ]
				ifFalse: [ aSelector ])