calculating elements
allSuperclassesBelowObject: aClass
	| supers sprClass |
	supers := OrderedCollection new.
	sprClass := aClass superclass.
	[ sprClass notNil and: [ Object ~= sprClass ] ]
		whileTrue: [ supers add: sprClass.
			sprClass := sprClass superclass ].
	^ supers