calculating elements
addedMethodsForSelector: aSelector withOriginals: originalMethods
	| implementors originalMethod result afters afterSelector afterOriginalMethod beforeSelector befores beforeOriginalMethod |
	afterSelector := ('after_' , aSelector) asSymbol.
	beforeSelector := ('before_' , aSelector) asSymbol.

	result := OrderedCollection new.

	implementors := (self superclassLinealization select: [ :aClass | aClass localSelectors includes: aSelector ]) asOrderedCollection.
	afters := (self superclassLinealization select: [ :aClass | aClass localSelectors includes: afterSelector ]) asOrderedCollection.
	befores := (self superclassLinealization select: [ :aClass | aClass localSelectors includes: beforeSelector ]) asOrderedCollection.

	originalMethod := originalMethods detect: [ :e | e selector = aSelector ] ifNone: nil.
	afterOriginalMethod := originalMethods detect: [ :e | e selector = afterSelector ] ifNone: nil.
	beforeOriginalMethod := originalMethods detect: [ :e | e selector = beforeSelector ] ifNone: nil.

	beforeOriginalMethod ifNotNil: [ result add: (EMRenameAddedMethod for: beforeOriginalMethod newSelector: aSelector) ].
	result addAll: (befores collect: [ :e | EMAddedMethod for: (e name , '___' , beforeSelector) asSymbol from: self ]).

	originalMethod ifNotNil: [ result ifEmpty: [ result add: originalMethod ] ifNotEmpty: [ result add: (EMRenameAddedMethod for: originalMethod newSelector: (self referedClass name , '___' , aSelector) asSymbol) ] ].
	
	result ifEmpty: [  
			result add: (EMAddedMethod for: aSelector from: self).
			implementors removeFirst.
		].
	
	result addAll: (implementors collect: [ :e | EMAddedMethod for: (e name , '___' , aSelector) asSymbol from: self ]).

	afterOriginalMethod ifNotNil: [ result add: (EMRenameAddedMethod for: afterOriginalMethod newSelector: (self referedClass name , '___' , afterSelector) asSymbol) ].
	result addAll: (afters collect: [ :e | EMAddedMethod for: (e name , '___' , afterSelector) asSymbol from: self ]).
	
	^ result