tests
testInvokingAMethodDefinedOnlyInSuperclassWithInner2
	| obj |
	newClass := ExtensibleMetaclass
		newBetaSubclass: #EMSimpleTestClass
		superClass: EMBSimpleClassWithInner2
		slots: #()
		classSlots: #()
		sharedVariables: ''
		poolDictionaries: ''
		category: 'ExtensibleMetaclass-Beta-Tests'.

	obj := newClass new.

	self assert: (obj performBetaStyle: #returnACollectionOfNumbers withArgs: #() below: Object) equals: obj.
	self assert: obj returnACollectionOfNumbers equals: obj