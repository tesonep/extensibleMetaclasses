calculating elements
calculateMethodOperations: originalMethods for: aClass
	| extensionMethods newOriginals |
	extensionMethods := self extensionClass localMethods
		reject: [ :m | m isAbstract ]
		thenCollect: [ :m | EMAddedMethod for: m selector from: self ].

	newOriginals := originalMethods
		collect: [ :m | 
			EMAddedSyntheticMethod
				selector: m selector
				source: (self betaInvocationFor: m selector)
				from: self ].

	^ super calculateMethodOperations: extensionMethods , newOriginals for: aClass