as yet unclassified
somethingRecursive: aValue
	aValue = 0
		ifTrue: [ ^ 0 ].

	^ aValue + (self somethingRecursive: aValue - 1)