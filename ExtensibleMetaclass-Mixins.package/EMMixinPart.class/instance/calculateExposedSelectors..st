accessing
calculateExposedSelectors: originalSelectors
	^ originalSelectors , (self superclassLinealization flatCollect: #exposedSelectors)