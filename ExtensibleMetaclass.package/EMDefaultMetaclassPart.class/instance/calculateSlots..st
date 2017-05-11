calculating elements
calculateSlots: originalSlots
	| newSlots |
	newSlots := (EMClassExtension slots collect: [ :e | e class named: e name ]) asOrderedCollection.
	^ super calculateSlots: newSlots , originalSlots