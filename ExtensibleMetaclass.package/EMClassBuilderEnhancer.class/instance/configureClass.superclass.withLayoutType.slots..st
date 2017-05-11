class modifications
configureClass: newClass superclass: superclass withLayoutType: layoutType slots: slots
	| newSlots |
	newSlots := parts calculateSlots: slots.
	newClass superclass: superclass withLayoutType: layoutType slots: newSlots.
	
	newClass instVarNamed: #parts put: parts. 