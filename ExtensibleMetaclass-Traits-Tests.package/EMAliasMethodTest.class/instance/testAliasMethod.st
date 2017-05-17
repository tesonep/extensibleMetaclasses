tests
testAliasMethod
	| anObject |
	newClass := ExtensibleMetaclass
		newSubclass: #EMASimpleTraitedClass
		superClass: Object
		uses: (EMAliasMethodElement on: (EMSimpleTraitForTest asEMTraitComposition) replace: #aMethod with: #otherFancyName)
		slots: #()
		classSlots: #()
		sharedVariables: ''
		poolDictionaries: ''
		category: 'ExtensibleMetaclass-Traits-Tests'.

	anObject := newClass new.
	anObject aSlot: 21.

	self assert: anObject aSlot equals: 21.
	self assert: (anObject perform:#otherFancyName) equals: 42.
	self assert: anObject anotherMethod equals: (42*21).
	
	self assertCollection: newClass localSelectors equals: #() asSet.
	self assertCollection: newClass class localSelectors equals: #() asSet.
