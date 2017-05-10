tests
testCreateEmptySubclass
	newClass := ExtensibleMetaclass
		newSubclass: #EMSimpleTestClass
		superClass: EMSuperTestClass
		slots: #()
		classVariables: ''
		poolDictionaries: ''
		category: 'ExtensibleMetaclass-Tests'.

	self assert: newClass isNotNil.
	self assert: newClass class class equals: EMMetaclass.
	newClass instVarNamed: #composition.
	newClass class instVarNamed: #composition.

	newClass instVarNamed: #aMetaInstanceVariable.
	newClass new instVarNamed: #anInstanceVariable.
		
	self assert: newClass aClassMethod equals: 42.
	self assert: newClass new aMethod equals: 42.