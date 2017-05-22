calculating elements
calculateSlots: originalSlots
	| newSlots |
	newSlots := OrderedCollection new.
	self superclassLinealization
		do: [ :aClass | 
			aClass slots
				do: [ :e | 
					(originalSlots anySatisfy: [ :originalSlot | originalSlots name = e name ])
						ifFalse: [ newSlots add: (e class named: e name) ] ] ].

	^ nextPart calculateSlots: newSlots , originalSlots