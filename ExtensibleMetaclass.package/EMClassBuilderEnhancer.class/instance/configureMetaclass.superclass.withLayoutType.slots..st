class modifications
configureMetaclass: newMetaclass superclass: superclass withLayoutType: aLayoutType slots: classSlots
	| newSlots |
	"I have to extend the normal created class object with the slots of the EMClassExtension"
	newSlots := (EMClassExtension slots collect:[:e | e class named: e name]) asOrderedCollection.
	newSlots addAll: (composition calculateClassSlots: classSlots).

	newMetaclass superclass: superclass withLayoutType: aLayoutType slots: newSlots asArray.