instance creation
for: aSelector with: method
	^ self new
		selector: aSelector;
		method: method;
		yourself