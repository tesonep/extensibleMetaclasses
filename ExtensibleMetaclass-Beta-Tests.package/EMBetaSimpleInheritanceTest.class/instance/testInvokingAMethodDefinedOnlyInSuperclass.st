tests
testInvokingAMethodDefinedOnlyInSuperclass
	| obj |
	newClass := ExtensibleMetaclass
		newBetaSubclass: #EMSimpleTestClass
		superClass: EMBSimpleClassWithoutInner
		slots: #()
		classSlots: #()
		sharedVariables: ''
		poolDictionaries: ''
		category: 'ExtensibleMetaclass-Beta-Tests'.

	obj := newClass new.

	self assertCollection: (obj performBetaStyle: #returnACollectionOfNumbers withArgs: #() below: Object) equals: {42}.
	self assertCollection: obj returnACollectionOfNumbers equals: {42}