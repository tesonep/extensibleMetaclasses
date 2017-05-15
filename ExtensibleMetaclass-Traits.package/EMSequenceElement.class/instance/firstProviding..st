accessing
firstProviding: aSelector
	| parts |
	parts := aSelector splitOn: '_'.

	(parts size = 1 or: [ (parts at: 1) ~= 'initializeTrait' ])
		ifTrue: [ ^ {(sequence
				detect: [ :e | e hasMethod: aSelector ]
				ifNone: [ self error: 'There is no element in the sequence provinding ' , aSelector printString ])} , {aSelector} ].

	^ {(sequence detect: [ :e | e name = (parts at: 2) ])} , {(parts at: 1) asSymbol}