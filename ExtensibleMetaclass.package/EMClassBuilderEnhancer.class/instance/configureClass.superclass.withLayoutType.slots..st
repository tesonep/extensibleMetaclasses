class modifications
configureClass: newClass superclass: superclass withLayoutType: layoutType slots: slots
	newClass superclass: superclass withLayoutType: layoutType slots: (parts calculateSlots: slots).
	newClass instVarNamed: #parts put: parts.
	newClass ensureLocalSelectors.
