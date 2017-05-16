selectors
hasMethod: aSelector
	^ aSelector ~= removedSelector and: [ super hasMethod: aSelector ]