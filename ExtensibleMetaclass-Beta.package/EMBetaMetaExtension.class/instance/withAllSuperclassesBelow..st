as yet unclassified
withAllSuperclassesBelow: aClass
	| supers sprClass |
	supers := OrderedCollection new.
	sprClass := self superclass.

	[ sprClass notNil and: [ sprClass ~= aClass ] ]
		whileTrue: [ supers add: sprClass.
			sprClass := sprClass superclass ].

	^ supers
		add: self;
		yourself