testing
hasMethod: aSelector
	^ (innerClass allSelectorsBelow: Object) includes: aSelector.