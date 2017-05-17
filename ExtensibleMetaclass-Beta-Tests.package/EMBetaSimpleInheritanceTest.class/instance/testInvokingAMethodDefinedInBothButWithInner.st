tests
testInvokingAMethodDefinedInBothButWithInner
	| obj |
	newClass := ExtensibleMetaclass
		newBetaSubclass: #EMSimpleTestClass
		superClass: EMBSimpleClassWithInner
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


	self assertCollection: (obj performBetaStyle: #returnACollectionOfNumbers withArgs: #() below: Object) equals: {42. 23. 10}.
	self assertCollection: obj returnACollectionOfNumbers equals: {42. 23. 10}