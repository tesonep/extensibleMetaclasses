calculating elements
calculateMethodOperations: originalMethods for: aClass
	| extensionMethods linealizedMethods |
		
	extensionMethods := EMMixinExtension localMethods
		reject: [ :m | m isAbstract ]
		thenCollect: [ :m | EMAddedMethod for: m selector from: self ].

	aClass superclassLinealization: self superclassLinealization.

	linealizedMethods := self allSelectorsInLinealization collect:[:e | EMAddedMethod for: e from: self ].

	^ super calculateMethodOperations: linealizedMethods, extensionMethods , originalMethods for: aClass