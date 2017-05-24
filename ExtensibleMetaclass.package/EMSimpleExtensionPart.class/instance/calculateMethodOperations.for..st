calculating elements
calculateMethodOperations: originalMethods for: aClass
	| extensionMethods |
	extensionMethods := (self extensionClass exposedSelectors collect:[:s | self extensionClass >> s])
		reject: [ :m | m isAbstract ]
		thenCollect: [ :m | EMAddedMethod for: m selector from: self ].
				
	^ super calculateMethodOperations: extensionMethods , originalMethods for: aClass.