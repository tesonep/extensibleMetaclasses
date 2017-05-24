accessing
compiledMethodAt: aSelector
	^ self compiledMethodAt: aSelector ifAbsent: [ NotFound signalFor: aSelector ]