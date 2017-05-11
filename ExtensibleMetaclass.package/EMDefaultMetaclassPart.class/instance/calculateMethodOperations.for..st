calculating elements
calculateMethodOperations: originalMethods for: aClass
	| extensionMethods |
	extensionMethods := EMClassExtension localMethods
		reject: [ :m | aClass canUnderstand: m selector ]
		thenCollect: [ :m | EMAddedMethod for: m from: self ].
		
	^ super calculateMethodOperations: extensionMethods , originalMethods for: aClass.