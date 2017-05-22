calculating elements
calculateSlots: originalSlots
	| newSlots |
	newSlots := (self extensionClass slots collect: [ :e | e class named: e name ]) asOrderedCollection.
	^ super calculateSlots: newSlots , originalSlots