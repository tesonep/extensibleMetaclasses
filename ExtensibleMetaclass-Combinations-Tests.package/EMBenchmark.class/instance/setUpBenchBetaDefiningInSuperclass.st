initialization
setUpBenchBetaDefiningInSuperclass
	
	newSuperclass := Object
		subclass: #EMTraitTestClass
		slots: #(anInstanceVariable)
		classVariables: ''
		poolDictionaries: ''
		category: 'ExtensibleMetaclass-Tests'.

	newSuperclass
		compile:
			'aMethod: aValue
		^ 42 + aValue
	'.

	newClass := ExtensibleMetaclass
		newBetaSubclass: #EMClassTestClass
		superClass: newSuperclass
		slots: #(otherInstanceVariable)
		classSlots: #()
		sharedVariables: ''
		poolDictionaries: ''
		category: 'ExtensibleMetaclass-Tests'.

	obj := newClass new.
