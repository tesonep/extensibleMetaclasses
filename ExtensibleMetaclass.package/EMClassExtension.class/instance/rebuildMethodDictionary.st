initialization
rebuildMethodDictionary
	| originalMethods |
	self ensureLocalSelectors.
	originalMethods := self localMethods collect: [ :e | EMOriginalMethod for: e selector with: e ].
	(self parts calculateMethodOperations: originalMethods for: self)
		do: [ :aMethodOperation | aMethodOperation applyOn: self ].
	
	self parts afterMethodRebuild: self.