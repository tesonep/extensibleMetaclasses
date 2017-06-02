initialization
setUpBenchTraitsDefiningInClass
	newSuperclass := Object
		subclass: #EMTraitTestClass
		slots: #(anInstanceVariable)
		classVariables: ''
		poolDictionaries: ''
		category: 'ExtensibleMetaclass-Tests'.

	newClass := ExtensibleMetaclass
		newSubclass: #EMClassTestClass
		superClass: Object
		uses: newSuperclass
		slots: #(otherInstanceVariable)
		classSlots: #()
		sharedVariables: ''
		poolDictionaries: ''
		category: 'ExtensibleMetaclass-Tests'.
		
	newClass
		compile:
			'aMethod: aValue
		^ 42 + aValue
	'.