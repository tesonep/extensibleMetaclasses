accessing
rebuildMethodDictionary
	| originalMethods |
	self ensureLocalSelectors.
	originalMethods := self localMethods collect: [ :e | EMOriginalMethod for: e ].
	
	(self parts calculateMethodOperations: originalMethods for: self) do: [ :aMethodOperation | aMethodOperation applyOn: self ].
	
	^ methodDict 