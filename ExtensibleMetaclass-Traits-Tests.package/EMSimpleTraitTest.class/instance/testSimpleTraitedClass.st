tests
testSimpleTraitedClass
	| anObject |
	newClass := ExtensibleMetaclass
		newSubclass: #EMASimpleTraitedClass
		superClass: Object
		uses: EMSimpleTraitForTest
		slots: #()
		classSlots: #()
		sharedVariables: ''
		poolDictionaries: ''
		category: 'ExtensibleMetaclass-Traits-Tests'.

	anObject := newClass new.
	anObject aSlot: 21.

	self assert: anObject aMethod equals: 42.
	self assert: anObject aSlot equals: 21.
	self assert: anObject aMethod equals: 42.
	self assert: anObject anotherMethod equals: (42*21).

	self assert: (newClass localSelectors isEmpty).	
	self assert: (newClass class localSelectors isEmpty).	

	self deny: (newClass localSelectors includes: #aMethod).
	self deny: (newClass localSelectors includes: #anotherMethod).
