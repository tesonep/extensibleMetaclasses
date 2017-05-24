accessing
selectors
	| coll |
	coll := IdentitySet new.
	innerClass
		withAllSuperclassesDo: [ :aClass | 
			aClass = Object
				ifTrue: [ ^ coll ]
				ifFalse: [ coll addAll: aClass exposedSelectors ] ].
	^ coll