adding/removing methods
lookupSelector: aSelector
	self hiddenMethodDict at: aSelector ifPresent: [ :method | ^ method ].
	self superclass == nil
		ifTrue: [ ^ nil ]
		ifFalse:[ ^ self superclass lookupSelector: aSelector].
