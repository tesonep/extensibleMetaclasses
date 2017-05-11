class modifications
configureClass: newClass superclass: superclass withLayoutType: layoutType slots: slots
	| newSlots |
	newSlots := composition calculateSlots: slots.
	newClass superclass: superclass withLayoutType: layoutType slots: newSlots.