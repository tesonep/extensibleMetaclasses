compiling methods
sourceCodeAt: aSelector
	(aSelector = removedSelector ) ifTrue:[NotFound signalFor: aSelector].
	^ super sourceCodeAt: aSelector