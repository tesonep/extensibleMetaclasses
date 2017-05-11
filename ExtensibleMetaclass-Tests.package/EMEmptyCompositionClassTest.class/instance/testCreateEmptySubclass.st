tests
testCreateEmptySubclass
	newClass := ExtensibleMetaclass
		newSubclass: #EMSimpleTestClass
		superClass: EMSuperTestClass
		slots: #()
		classSlots: #()
		sharedVariables: ''
		poolDictionaries: ''
		category: 'ExtensibleMetaclass-Tests'.

	self assert: newClass isNotNil.
	self assert: newClass class class equals: EMMetaclass.
	newClass instVarNamed: #parts.
	newClass class instVarNamed: #parts.

	newClass instVarNamed: #aMetaInstanceVariable.
	newClass new instVarNamed: #anInstanceVariable.

	self assert: newClass aClassMethod equals: 42.
	self assert: newClass new aMethod equals: 42.

	newClass class >> #rebuildMethodDictionary.
	self deny: (newClass class localSelectors includes: #parts).
	self deny: (newClass class localSelectors includes: #parts:).
	self deny: (newClass class localSelectors includes: #rebuildMethodDictionary).
	