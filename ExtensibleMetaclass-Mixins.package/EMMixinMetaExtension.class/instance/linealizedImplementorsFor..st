calculating selectors
linealizedImplementorsFor: aSelector
	| implementors |
	implementors := (self superclassLinealization select: [ :e | e exposedSelectors includes: aSelector ]) asOrderedCollection.

	^ (self localSelectors includes: aSelector)
		ifTrue: [ (OrderedCollection with: self) , implementors ]
		ifFalse: [ implementors ]