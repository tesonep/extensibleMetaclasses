tests
testMultiInheritanceFromTraitedClasses
	| obj |
	newSuperclass := ExtensibleMetaclass
		newSubclass: #EMASimpleSuperClass
		superClass: Object
		uses: EMCTestBeforeTrait
		slots: #()
		classSlots: #()
		sharedVariables: ''
		poolDictionaries: ''
		category: 'ExtensibleMetaclass-Mixins-Tests'.

	newSuperclass2 := ExtensibleMetaclass
		newSubclass: #EMASimpleSuperClass2
		superClass: newSuperclass
 		uses: EMCTestAfterTrait
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

	newClass := ExtensibleMetaclass 
		newSubclass: #EMASimpleMixedClass
		superClasses: { newSuperclass2. newSuperclass }
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

	self assertCollection: newClass superclassLinealization equals: {newSuperclass2. newSuperclass}.
	self assert: (String streamContents: [ :s | obj aMethod: s]) equals: 'before newClass newSuperclass2 newSuperclass after '.
