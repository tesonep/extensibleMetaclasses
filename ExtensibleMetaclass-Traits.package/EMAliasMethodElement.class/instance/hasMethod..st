selectors
hasMethod: aSelector
	^ aSelector = newSelector or: [ super hasMethod: aSelector ]