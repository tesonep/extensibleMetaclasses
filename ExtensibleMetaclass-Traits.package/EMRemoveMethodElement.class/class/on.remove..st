as yet unclassified
on: anElement remove: aSelector
	^ self new
		innerElement: anElement;
		removedSelector: aSelector;
		yourself