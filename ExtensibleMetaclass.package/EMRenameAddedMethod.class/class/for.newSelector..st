instance creation
for: anAddedMethod newSelector: aSelector
	^ self new
		addedMethod: anAddedMethod;
		newSelector: aSelector;
		yourself