calculating elements
calculateLinealization
	| result |
	result := OrderedCollection new.
	result addAll: superclasses.

	result
		do: [ :aClass | 
			(aClass canPerform: #superclassLinealization)
				ifTrue: [ result addAll: aClass superclassLinealization ]
				ifFalse: [ result addAll: (self allSuperclassesBelowObject: aClass) ] ].

	result asBag doWithOccurrences: [ :e :occurs | 1 to: occurs - 1 do: [ :i | result remove: e ] ].

	^ result asArray