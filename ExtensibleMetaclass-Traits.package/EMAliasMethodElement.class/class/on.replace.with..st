as yet unclassified
on: anElement replace: oldSelector with: newSelector
	^ self new
		innerElement: anElement;
		oldSelector: oldSelector;
		newSelector: newSelector;
		yourself