tests
testExtendingEnhancedClass
	newClass := ExtensibleMetaclass
		newSubclass: #EMSimpleTestClass
		superClass: Object
		slots: #(anInstanceVariable)
		classSlots: #(aMetaInstanceVariable)		
		sharedVariables: ''
		poolDictionaries: ''
		category: 'ExtensibleMetaclass-Tests'.

	newClass compile: 'aMethod
		^ 42.
	'.

	newClass class compile: 'aClassMethod
		^ 42.
	'.

	self assert: newClass isNotNil.
	self assert: newClass class class = EMMetaclass.
	newClass instVarNamed: #parts.
	newClass class instVarNamed: #parts.
	
	newClass instVarNamed: #aMetaInstanceVariable.
	newClass new instVarNamed: #anInstanceVariable.

	self assert: newClass aClassMethod equals: 42.
	self assert: newClass new aMethod equals: 42.

	newClass := ExtensibleMetaclass
		newSubclass: #EMSimpleTestClass
		superClass: Object
		slots: #(anInstanceVariable)
		classSlots: #(aMetaInstanceVariable)		
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
	self assert: newClass new aMethod equals: 42