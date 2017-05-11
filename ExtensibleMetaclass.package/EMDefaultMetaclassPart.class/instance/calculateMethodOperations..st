calculating elements
calculateMethodOperations: originalMethods
	| extensionMethods |
	extensionMethods := EMClassExtension localMethods collect:[:m | EMAddedMethod for: m from: self].
	^ super calculateMethodOperations: extensionMethods , originalMethods 