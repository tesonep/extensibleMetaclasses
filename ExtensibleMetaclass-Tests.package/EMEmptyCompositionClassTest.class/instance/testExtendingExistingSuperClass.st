tests
testExtendingExistingSuperClass
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

	newClass := newClass2
		subclass: #EMSimpleTestSubClass
		slots: #()
		classVariables: ''
		poolDictionaries: ''
		category: 'ExtensibleMetaclass-Tests'.

	self assert: newClass isNotNil.
	self should:[newClass instVarNamed: #composition] raise:Error.
	self should:[newClass class instVarNamed: #composition] raise:Error.
	
	newClass instVarNamed: #aMetaInstanceVariable.
	newClass new instVarNamed: #anInstanceVariable.

	self assert: newClass aClassMethod equals: 42.
	self assert: newClass new aMethod equals: 42.
	
	newClass instVarNamed: #aMetaInstanceVariable put: 52.

	newClass2 := ExtensibleMetaclass
		newSubclass: #EMSimpleTestClass
		superClass: Object
		slots: #(anInstanceVariable otherInstanceVariable)
		classVariables: ''
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
	