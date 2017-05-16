compiling methods
compiledMethodAt: aSelector
	(aSelector = removedSelector ) ifTrue:[NotFound signalFor: aSelector].
	^ super compiledMethodAt: aSelector