benchs
setUpBenchMultiInheritanceDefiningInClass
	newSuperclass := Object
		subclass: #EMTraitTestClass
		slots: #(anInstanceVariable)
		classVariables: ''
		poolDictionaries: ''
		category: 'ExtensibleMetaclass-Tests'.

	newClass := ExtensibleMetaclass
		newSubclass: #EMClassTestClass
		superClasses: {newSuperclass}
		slots: #(otherInstanceVariable)
		classSlots: #()
		sharedVariables: ''
		poolDictionaries: ''
		category: 'ExtensibleMetaclass-Tests'.

	newClass
		compile:
			'aMethod: aValue
		^ 22 + aValue
	'.
