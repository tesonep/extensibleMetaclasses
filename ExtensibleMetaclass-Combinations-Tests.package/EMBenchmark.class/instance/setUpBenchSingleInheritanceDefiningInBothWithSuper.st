benchs
setUpBenchSingleInheritanceDefiningInBothWithSuper
	newSuperclass := Object
		subclass: #EMSuperclassTestClass
		slots: #(anInstanceVariable)
		classVariables: ''
		poolDictionaries: ''
		category: 'ExtensibleMetaclass-Tests'.

	newClass := newSuperclass
		subclass: #EMClassTestClass
		slots: #(otherInstanceVariable)
		classVariables: ''
		poolDictionaries: ''
		category: 'ExtensibleMetaclass-Tests'.

	newSuperclass
		compile:
			'aMethod: aValue
		^ 42 + aValue
	'.

	newClass
		compile:
			'aMethod: aValue
		^ 22 + (super aMethod: aValue)
	'.