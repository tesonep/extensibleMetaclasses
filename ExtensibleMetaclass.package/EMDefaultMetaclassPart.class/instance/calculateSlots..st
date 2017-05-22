calculating elements
calculateSlots: originalSlots
	| newSlots |
	newSlots := (self extensionClass slots
		collect: [ :e | e class named: e name ]
		thenReject:
			[ :e | self referedSuperclass allSlots anySatisfy: [ :superSlot | superSlot name = e name ] ])
		asOrderedCollection.

	^ nextPart calculateSlots: newSlots , originalSlots