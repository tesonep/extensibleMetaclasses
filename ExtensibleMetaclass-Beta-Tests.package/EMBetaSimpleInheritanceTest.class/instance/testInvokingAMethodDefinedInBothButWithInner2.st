tests
testInvokingAMethodDefinedInBothButWithInner2
	| obj |
	newClass := ExtensibleMetaclass
		newBetaSubclass: #EMSimpleTestClass
		superClass: EMBSimpleClassWithInner2
		slots: #()
		classSlots: #()
		sharedVariables: ''
		poolDictionaries: ''
		category: 'ExtensibleMetaclass-Beta-Tests'.

	newClass
		compile:
			'returnACollectionOfNumbers
		^ { 23. 10 }
	'.

	obj := newClass new.


	self assertCollection: (obj performBetaStyle: #returnACollectionOfNumbers withArgs: #() below: Object) equals: {23. 10}.
	self assertCollection: obj returnACollectionOfNumbers equals: {23. 10}