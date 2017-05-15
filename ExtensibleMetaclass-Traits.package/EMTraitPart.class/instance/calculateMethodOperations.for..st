calculating elements
calculateMethodOperations: originalMethods for: aClass
	| extensionMethods |
	extensionMethods := traitComposition selectors
		collect: [ :s | EMAddedMethod for: s from: self ].

	^ super
		calculateMethodOperations: extensionMethods , originalMethods
		for: aClass