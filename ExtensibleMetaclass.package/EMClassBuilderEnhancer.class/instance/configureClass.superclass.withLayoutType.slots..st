class modifications
configureClass: newClass superclass: superclass withLayoutType: layoutType slots: slots
	parts referedClass: newClass.
	parts referedSuperclass: superclass.

	newClass
		superclass: superclass
		withLayoutType: layoutType
		slots: (parts calculateSlots: slots).
	newClass instVarNamed: #parts put: parts.
	newClass ensureLocalSelectors