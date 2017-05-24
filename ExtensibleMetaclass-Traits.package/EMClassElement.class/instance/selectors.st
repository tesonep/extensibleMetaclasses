accessing
selectors
	^ innerClass isMeta
		ifTrue: [ innerClass allSelectorsBelow: Object class ]
		ifFalse: [ innerClass allSelectorsBelow: Object ]