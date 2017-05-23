tests
testMultiInheritanceFromClassesSharingSuperclassWithSuperWithoutAfterOrBefore
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

		
	newSuperclass compile: 'aMethod: aStream
		aStream nextPutAll: ''newSuperclass''.
		aStream nextPut: Character space.
		self nextMethodWithArgs: { aStream }.
	'.

	newSuperclass2 compile: 'aMethod: aStream
		aStream nextPutAll: ''newSuperclass2''.
		aStream nextPut: Character space.
		self nextMethodWithArgs: { aStream }.
	'.

	newSuperclass3 compile: 'aMethod: aStream
		aStream nextPutAll: ''newSuperclass3''.
		aStream nextPut: Character space.
		self nextMethodWithArgs: { aStream }.
	'.


	newClass := ExtensibleMetaclass 
		newSubclass: #EMASimpleMixedClass
		superClasses: { newSuperclass2. newSuperclass3 }
		slots: #()
		classSlots: #()
		sharedVariables: ''
		poolDictionaries: ''
		category: 'ExtensibleMetaclass-Mixins-Tests'.

	newClass compile: 'aMethod: aStream
		aStream nextPutAll: ''newClass''.
		aStream nextPut: Character space.
		self nextMethodWithArgs: { aStream }.
	'.


	obj := newClass new.

	self assertCollection: newClass superclassLinealization equals: {newSuperclass2. newSuperclass3. newSuperclass}.
	self assert: (String streamContents: [ :s | obj aMethod: s]) equals: 'newClass newSuperclass2 newSuperclass3 newSuperclass '.
