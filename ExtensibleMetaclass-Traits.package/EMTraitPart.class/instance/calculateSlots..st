calculating elements
calculateSlots: originalSlots
	| newSlots |
	newSlots := (traitComposition slots
		collect: [ :e | e class named: e name ]
		thenReject: [ :e | 
			(self referedSuperclass allSlots anySatisfy: [ :superSlot | superSlot name = e name ])
				or: [ originalSlots anySatisfy: [ :other | other name = e name ] ] ])
		asOrderedCollection.

	^ super calculateSlots: newSlots , originalSlots