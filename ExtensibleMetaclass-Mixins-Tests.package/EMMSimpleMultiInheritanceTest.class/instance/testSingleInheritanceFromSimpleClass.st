tests
testSingleInheritanceFromSimpleClass
	| obj |
	newSuperclass := ExtensibleMetaclass
		newSubclass: #EMASimpleSuperClass
		superClass: Object
		slots: #()
		classSlots: #()
		sharedVariables: ''
		poolDictionaries: ''
		category: 'ExtensibleMetaclass-Mixins-Tests'.
		
	newSuperclass compile: 'aMethod
		^42
	'.

	newSuperclass compile: 'anotherMethod: aValue
		^ aValue + 42
	'.


	newClass := ExtensibleMetaclass 
		newSubclass: #EMASimpleMixedClass
		superClasses: { newSuperclass }
		slots: #()
		classSlots: #()
		sharedVariables: ''
		poolDictionaries: ''
		category: 'ExtensibleMetaclass-Mixins-Tests'.

	obj := newClass new.

	self assert: (obj perform: #aMethod) equals: 42.
	self assert: (obj perform: #anotherMethod: withArguments: {12}) equals: 54.