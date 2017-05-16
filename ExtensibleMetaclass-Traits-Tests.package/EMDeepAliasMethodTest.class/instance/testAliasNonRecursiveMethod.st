tests
testAliasNonRecursiveMethod
	| anObject |
	newClass := ExtensibleMetaclass
		newSubclass: #EMASimpleTraitedClass
		superClass: Object
		uses: (EMDeepAliasMethodElement on: (EMSimpleTraitForTest asEMTraitComposition) replace: #aMethod with: #otherFancyName)
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
