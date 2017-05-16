tests
testAliasRecursiveMethod
	| anObject |
	newClass := ExtensibleMetaclass
		newSubclass: #EMASimpleTraitedClass
		superClass: Object
		uses: (EMDeepAliasMethodElement on: (EMRecursiveTraitForTest asEMTraitComposition) replace: #somethingRecursive: with: #otherFancyName:)
		slots: #()
		classSlots: #()
		sharedVariables: ''
		poolDictionaries: ''
		category: 'ExtensibleMetaclass-Traits-Tests'.

	anObject := newClass new.

	self assert: (anObject perform:#aMessageUsingRecursion) equals: 903.
