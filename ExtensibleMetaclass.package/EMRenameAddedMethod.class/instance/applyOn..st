accessing
applyOn: aClass
	aClass recompileInternal: newSelector from: self.
