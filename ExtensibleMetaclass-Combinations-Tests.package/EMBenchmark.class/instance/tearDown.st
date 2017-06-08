running
tearDown
	obj := nil.
	newClass ifNotNil: #removeFromSystem.
	newClass2 ifNotNil: #removeFromSystem.
	newSuperclass3 ifNotNil: #removeFromSystem.
	newSuperclass2 ifNotNil: #removeFromSystem.
	newSuperclass ifNotNil: #removeFromSystem.
	super tearDown