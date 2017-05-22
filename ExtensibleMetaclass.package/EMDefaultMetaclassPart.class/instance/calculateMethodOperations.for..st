calculating elements
calculateMethodOperations: originalMethods for: aClass
	| extensionMethods |
	extensionMethods := {(EMAddedSyntheticMethod
		selector: #hiddenMethodDict
		source:
			'hiddenMethodDict
		^ methodDict
	'
		from: self)}.

	^ super calculateMethodOperations: extensionMethods , originalMethods for: aClass