calculating elements
calculateExposedSelectors: originalSelectors
	^ originalSelectors , self extensionClass exposedSelectors.