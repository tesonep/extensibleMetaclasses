tests
testCreateEmptySimpleClass
	newClass := ExtensibleMetaclass
		newSubclass: #EMSimpleTestClass
		superClass: Object
		slots: #()
		classSlots: #()
		sharedVariables: ''
		poolDictionaries: ''
		category: 'ExtensibleMetaclass-Tests'.

	self assert: newClass isNotNil.
	self assert: newClass class class equals: EMMetaclass.
	self assert: (newClass class hasInstVarNamed: #parts).
	self assert: (newClass class class hasInstVarNamed: #parts).
	
	self assert: newClass methodDict isNotNil.
	self assert: newClass hiddenMethodDict isNotNil.
