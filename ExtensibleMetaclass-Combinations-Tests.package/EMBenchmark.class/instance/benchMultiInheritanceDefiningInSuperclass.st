benchs
benchMultiInheritanceDefiningInSuperclass
	| obj |
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
		newSubclass: #EMClassTestClass
		superClasses: {newSuperclass}
		slots: #(otherInstanceVariable)
		classSlots: #()
		sharedVariables: ''
		poolDictionaries: ''
		category: 'ExtensibleMetaclass-Tests'.

		
	obj := newClass new.

	^ [ obj aMethod: 22 ] benchFor: self lapse