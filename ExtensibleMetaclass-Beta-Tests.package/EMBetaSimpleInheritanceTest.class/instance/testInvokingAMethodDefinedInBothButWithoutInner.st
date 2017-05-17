tests
testInvokingAMethodDefinedInBothButWithoutInner
	| obj |
	newClass := ExtensibleMetaclass
		newBetaSubclass: #EMSimpleTestClass
		superClass: EMBSimpleClassWithoutInner
		slots: #()
		classSlots: #()
		sharedVariables: ''
		poolDictionaries: ''
		category: 'ExtensibleMetaclass-Beta-Tests'.

	newClass
		compile:
			'returnACollectionOfNumbers
		^ { 42. 23 }
	'.

	obj := newClass new.


	self assertCollection: (obj performBetaStyle: #returnACollectionOfNumbers withArgs: #() below: Object) equals: {42}.
	self assertCollection: obj returnACollectionOfNumbers equals: {42}