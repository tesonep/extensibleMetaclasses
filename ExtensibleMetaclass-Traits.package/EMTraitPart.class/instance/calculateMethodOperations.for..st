calculating elements
calculateMethodOperations: originalMethods for: aClass
	| extensionMethods |
	extensionMethods := traitComposition methods collect: [ :m | EMAddedMethod for: m from: self ].

	^ super calculateMethodOperations: extensionMethods , originalMethods for: aClass