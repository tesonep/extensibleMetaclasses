calculating selectors
calculateOriginalSelector: aSelector
	| parts originalSelector |
	parts := aSelector splitOn: '___'.

	originalSelector := parts size = 1
		ifTrue: [ aSelector ]
		ifFalse: [ (parts at: 2) asSymbol ].

	^ ((originalSelector withoutPrefix: 'before_') withoutPrefix: 'after_') asSymbol