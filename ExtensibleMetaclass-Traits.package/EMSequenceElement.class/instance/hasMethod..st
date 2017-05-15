accessing
hasMethod: aSelector
	^ sequence anySatisfy: [ :e | e hasMethod: aSelector ]