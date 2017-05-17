accessing method dictionary
lookupSelector: aSelector
	methodDict at: aSelector ifPresent: [ :method | ^ method ].
	superclass == nil
		ifTrue: [ ^ nil ]
		ifFalse:[ ^ superclass lookupSelector: aSelector].
