tests
testMultiInheritanceClassAsATrait
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

	newSuperclass compile: 'aMethod: aStream
		aStream nextPutAll: ''newSuperclass''.
		aStream nextPut: Character space.
	'.

	newClass := ExtensibleMetaclass 
		newSubclass: #EMASimpleMixedClass
		superClasses: { newSuperclass2. newSuperclass }
		slots: #()
		classSlots: #()
		sharedVariables: ''
		poolDictionaries: ''
		category: 'ExtensibleMetaclass-Mixins-Tests'.

	newClass2 := ExtensibleMetaclass 
		newSubclass: #EMASimpleTraitedClass
		superClass: Object
		uses:  newClass
		usesClassTrait: newClass class
		slots:  #()
		classSlots:  #()
		sharedVariables:  ''
		poolDictionaries: ''
		category: 'ExtensibleMetaclass-Mixins-Tests'.

	obj := newClass2 new.

	self assert: (String streamContents: [ :s | obj aMethod: s]) equals: 'newSuperclass '.
