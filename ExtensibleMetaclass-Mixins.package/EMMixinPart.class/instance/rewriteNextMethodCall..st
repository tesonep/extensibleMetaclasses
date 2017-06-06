rewriting
rewriteNextMethodCall: someMethods
	| result |
	
	(someMethods size < 2) ifTrue:[^someMethods].

	result := OrderedCollection new.
	someMethods overlappingPairsDo:[:child :parent | result add: (self doRewriteNextMethodCall: child parentName: parent selector) ].
	
	result add: someMethods last.
	
	self assert: result size = someMethods size.
		
	^ result.