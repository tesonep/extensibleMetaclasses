tests
testRenameSlot
	| anObject |
	newClass := ExtensibleMetaclass
		newSubclass: #EMASimpleTraitedClass
		superClass: Object
		uses: (EMRenameSlot on:EMSimpleTraitForTest asEMTraitComposition from: #aSlot to: #xSlot)
		slots: #()
		classSlots: #()
		sharedVariables: ''
		poolDictionaries: ''
		category: 'ExtensibleMetaclass-Traits-Tests'.

	anObject := newClass new.
	anObject aSlot: 21.

	self assert: (newClass hasSlotNamed: #xSlot).

	self assert: anObject aMethod equals: 42.
	self assert: anObject aSlot equals: 21.
	self assert: anObject aMethod equals: 42.
	self assert: anObject anotherMethod equals: (42*21).
	