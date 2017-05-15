selectors
calculateInitializers
	(sequence allSatisfy: [ :e | e calculateInitializers isEmpty ])
		ifTrue: [ ^ #() ].
		
	^ #(initializeTrait) , (sequence collect:[ :e | self initializerFor: e]).