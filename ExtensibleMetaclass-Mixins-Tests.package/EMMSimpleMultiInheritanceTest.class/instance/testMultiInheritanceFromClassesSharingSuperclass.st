tests
testMultiInheritanceFromClassesSharingSuperclass
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
		superClass: newSuperclass
		slots: #()
		classSlots: #()
		sharedVariables: ''
		poolDictionaries: ''
		category: 'ExtensibleMetaclass-Mixins-Tests'.


	newSuperclass3 := ExtensibleMetaclass
		newSubclass: #EMASimpleSuperClass3
		superClass: newSuperclass
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

	newSuperclass3 compile: 'anotherMethod: aValue
		^ aValue + 52
	'.


	newClass := ExtensibleMetaclass 
		newSubclass: #EMASimpleMixedClass
		superClasses: { newSuperclass2. newSuperclass3 }
		slots: #()
		classSlots: #()
		sharedVariables: ''
		poolDictionaries: ''
		category: 'ExtensibleMetaclass-Mixins-Tests'.

	newClass compile: 'somethingElse
		^ true
	'.


	obj := newClass new.

	self assertCollection: newClass superclassLinealization equals: {newSuperclass2. newSuperclass3. newSuperclass}.
	self assert: (obj perform: #aMethod) equals: 42.
	self assert: (obj perform: #anotherMethod: withArguments: {12}) equals: 54.
	self assert: obj somethingElse.