tests
testSequenceRemoveMethodInsideSequenceWithLocalMethod
	| anObject |
	newClass := ExtensibleMetaclass
		newSubclass: #EMASimpleTraitedClass
		superClass: Object
		uses: (EMRemoveMethodElement on: EMSimpleTraitForTest asEMTraitComposition remove: #aMethod) + EMAnotherTraitForTest asEMTraitComposition 
		slots: #()
		classSlots: #()
		sharedVariables: ''
		poolDictionaries: ''
		category: 'ExtensibleMetaclass-Traits-Tests'.

	anObject := newClass new.
	anObject aSlot: 21.
	anObject anotherSlot: 10.

	self assert: anObject aSlot equals: 21.
	self should: [anObject aMethod ] raise:MessageNotUnderstood .
	self assert: anObject anotherMethod equals: 42 * 21.
	self assert: anObject anotherSlot equals: 10.
	
	self assertCollection: newClass localSelectors equals: #() asSet.
	self assertCollection: newClass class localSelectors equals: #() asSet.
	
	newClass compile: 'somethingElse
		^ self anotherMethod
	'.
	
	self assertCollection: newClass localSelectors equals: #(somethingElse) asSet.
	self assertCollection: newClass class localSelectors equals: #() asSet.