calculating elements
calculateMethodOperations: originalMethods for: aClass
	| extensionMethods linealizedMethods |
	extensionMethods := EMMixinExtension localMethods reject: [ :m | m isAbstract ] thenCollect: [ :m | EMAddedMethod for: m selector from: self ].

	aClass superclassLinealization: self superclassLinealization.

	linealizedMethods := (self allSelectorsInLinealizationWith: originalMethods) flatCollect: [ :e | self rewriteNextMethodCall:(self addedMethodsForSelector: e withOriginals: originalMethods) ].

	^ super calculateMethodOperations: linealizedMethods , extensionMethods for: aClass