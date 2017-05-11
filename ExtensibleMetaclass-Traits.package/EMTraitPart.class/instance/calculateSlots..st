calculating elements
calculateSlots: originalSlots
	| newSlots |
	newSlots := (traitComposition slots collect: [ :e | e class named: e name ]) asOrderedCollection.
	^ super calculateSlots: newSlots , originalSlots