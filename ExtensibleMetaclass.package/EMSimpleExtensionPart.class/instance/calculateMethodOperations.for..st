calculating elements
calculateMethodOperations: originalMethods for: aClass
	| extensionMethods |
	extensionMethods := self extensionClass localMethods
		reject: [ :m | m isAbstract ]
		thenCollect: [ :m | EMAddedMethod for: m selector from: self ].
				
	^ super calculateMethodOperations: extensionMethods , originalMethods for: aClass.