benchs
setUpBenchSingleInheritanceDefiningInClass
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

	newClass
		compile:
			'aMethod: aValue
		^ 42 + aValue
	'.

	obj := newClass new.
