accessing
rebuildMethodDictionary
	| originalMethods |
	localSelectors ifNil: [ localSelectors := self localSelectors ].
	originalMethods := self localMethods collect: [ :e | EMOriginalMethod for: e ].

	(self parts calculateMethodOperations: originalMethods) do: [ :aMethodOperation | aMethodOperation applyOn: self ]