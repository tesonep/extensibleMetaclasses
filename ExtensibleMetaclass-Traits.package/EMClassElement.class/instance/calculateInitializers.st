selectors
calculateInitializers
	^ (innerClass localSelectors includes: #initializeTrait)
		ifTrue: [ ^ #(initializeTrait) ]
		ifFalse: [ ^ #() ]