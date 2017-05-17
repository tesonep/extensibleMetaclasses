tests
testExtendingExistingClass
	newClass := Object
		subclass: #EMSimpleTestClass
		slots: #(anInstanceVariable)
		classVariables: ''
		poolDictionaries: ''
		category: 'ExtensibleMetaclass-Tests'.

	(Smalltalk at: #EMSimpleTestClass) compile: 'aMethod
		^ 42.
	'.

	(Smalltalk at: #EMSimpleTestClass) class compile: 'aClassMethod
		^ 42.
	'.


	(Smalltalk at: #EMSimpleTestClass) class instanceVariableNames: 'aMetaInstanceVariable'.

	self assert: newClass isNotNil.
	self deny: newClass class class = EMMetaclass.
	self should:[newClass instVarNamed: #parts] raise:Error.
	self should:[newClass class instVarNamed: #parts] raise:Error.
	
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
	self assert: newClass new aMethod equals: 42.
	
	self assertCollection: newClass localSelectors equals: #(aMethod) asSet.
	self assertCollection: newClass class localSelectors equals: #(aClassMethod) asSet.