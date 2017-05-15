tests
testSimpleInitializationSequence
	| anObject |
	newClass := ExtensibleMetaclass
		newSubclass: #EMASimpleTraitedClass
		superClass: Object
		uses: EMSimpleTraitForTest asEMTraitComposition + EMAnotherTraitForTest asEMTraitComposition
		slots: #()
		classSlots: #()
		sharedVariables: ''
		poolDictionaries: ''
		category: 'ExtensibleMetaclass-Traits-Tests'.

	anObject := newClass new.

	self assert: anObject aMethod equals: 42.
	self assert: anObject aSlot equals: 1.
	self assert: anObject aMethod equals: 42.
	self assert: anObject anotherMethod equals: 42.
	self assert: anObject anotherSlot equals: 42.	