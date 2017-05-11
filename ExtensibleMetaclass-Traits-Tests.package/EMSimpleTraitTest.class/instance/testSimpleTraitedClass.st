tests
testSimpleTraitedClass
	newClass := ExtensibleMetaclass
		newSubclass: #EMASimpleTraitedClass
		superClass: Object
		uses: EMSimpleTraitForTest 
		slots: {}
		sharedVariables: ''
		poolDictionaries: ''
		category: 'ExtensibleMetaclass-Traits-Tests'.
		
	self assert: newClass new aMethod equals: 42.