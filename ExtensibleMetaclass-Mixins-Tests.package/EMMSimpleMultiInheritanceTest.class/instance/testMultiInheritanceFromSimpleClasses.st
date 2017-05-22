tests
testMultiInheritanceFromSimpleClasses
	| obj |
	newSuperclass := ExtensibleMetaclass
		newSubclass: #EMASimpleSuperClass
		superClass: Object
		slots: #()
		classSlots: #()
		sharedVariables: ''
		poolDictionaries: ''
		category: 'ExtensibleMetaclass-Mixins-Tests'.

	newSuperclass2 := ExtensibleMetaclass
		newSubclass: #EMASimpleSuperClass2
		superClass: Object
		slots: #()
		classSlots: #()
		sharedVariables: ''
		poolDictionaries: ''
		category: 'ExtensibleMetaclass-Mixins-Tests'.

		
	newSuperclass compile: 'aMethod
		^42
	'.

	newSuperclass2 compile: 'anotherMethod: aValue
		^ aValue + 42
	'.


	newClass := ExtensibleMetaclass 
		newSubclass: #EMASimpleMixedClass
		superClasses: { newSuperclass. newSuperclass2 }
		slots: #()
		classSlots: #()
		sharedVariables: ''
		poolDictionaries: ''
		category: 'ExtensibleMetaclass-Mixins-Tests'.

	obj := newClass new.

	self assertCollection: newClass superclassLinealization equals: {newSuperclass. newSuperclass2}.
	self assert: (obj perform: #aMethod) equals: 42.
	self assert: (obj perform: #anotherMethod: withArguments: {12}) equals: 54.