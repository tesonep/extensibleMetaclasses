initialization
setUpBenchBetaDefiningInClass
	
	newSuperclass := Object
		subclass: #EMTraitTestClass
		slots: #(anInstanceVariable)
		classVariables: ''
		poolDictionaries: ''
		category: 'ExtensibleMetaclass-Tests'.

	newClass := ExtensibleMetaclass
		newBetaSubclass: #EMClassTestClass
		superClass: newSuperclass
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
	
	obj := newClass new.
