tests
testSequenceRenamingInsideSequence
	| anObject |
	newClass := ExtensibleMetaclass
		newSubclass: #EMASimpleTraitedClass
		superClass: Object
		uses: (EMRenameSlotElement on: EMSimpleTraitForTest asEMTraitComposition from: #aSlot to: #xSlot) + EMAnotherTraitForTest asEMTraitComposition 
		slots: #()
		classSlots: #()
		sharedVariables: ''
		poolDictionaries: ''
		category: 'ExtensibleMetaclass-Traits-Tests'.

	anObject := newClass new.
	anObject aSlot: 21.
	anObject anotherSlot: 10.

	self assert: (newClass hasSlotNamed: #xSlot).
	self deny: (newClass hasSlotNamed: #aSlot).

	self assert: anObject aMethod equals: 42.
	self assert: anObject aSlot equals: 21.
	self assert: anObject aMethod equals: 42.
	self assert: anObject anotherMethod equals: 42 * 21.
	self assert: anObject anotherSlot equals: 10