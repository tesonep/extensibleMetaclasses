tests
testModifyingAClassWithExtendedSubclass
	newClass2 := Object
		subclass: #EMSimpleTestClass
		slots: #(anInstanceVariable)
		classVariables: ''
		poolDictionaries: ''
		category: 'ExtensibleMetaclass-Tests'.

	newClass2 compile: 'aMethod
		^ 42.
	'.

	newClass2 class compile: 'aClassMethod
		^ 42.
	'.

	newClass2 class instanceVariableNames: 'aMetaInstanceVariable'.
	newClass2 instVarNamed: #aMetaInstanceVariable put: 23.

	newClass := ExtensibleMetaclass
		newSubclass: #EMSimpleTestSubClass
		superClass: newClass2
		slots: #()
		classSlots: #()		
		sharedVariables: ''
		poolDictionaries: ''
		category: 'ExtensibleMetaclass-Tests'.


	self assert: newClass isNotNil.
	newClass instVarNamed: #parts.
	newClass class instVarNamed: #parts.
	
	newClass instVarNamed: #aMetaInstanceVariable.
	newClass new instVarNamed: #anInstanceVariable.

	self assert: newClass aClassMethod equals: 42.
	self assert: newClass new aMethod equals: 42.
	
	newClass instVarNamed: #aMetaInstanceVariable put: 52.

	newClass2 := Object
		subclass: #EMSimpleTestClass
		instanceVariableNames: 'anInstanceVariable otherInstanceVariable'
		classVariableNames: ''
		poolDictionaries: ''
		category: 'ExtensibleMetaclass-Tests'.


	self assert: newClass isNotNil.

	newClass instVarNamed: #aMetaInstanceVariable.
	newClass new instVarNamed: #anInstanceVariable.
	newClass new instVarNamed: #otherInstanceVariable.

	self assert: (newClass2 instVarNamed: #aMetaInstanceVariable) equals: 23.
	self assert: newClass aClassMethod equals: 42.
	self assert: newClass new aMethod equals: 42.
	self assert: (newClass instVarNamed: #aMetaInstanceVariable) equals: 52.

	self assert: newClass theMetaClass class equals: EMMetaclass.	
	newClass instVarNamed: #parts.
	newClass class instVarNamed: #parts.
