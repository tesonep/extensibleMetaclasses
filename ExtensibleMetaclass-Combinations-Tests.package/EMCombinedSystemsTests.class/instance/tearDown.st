tests
tearDown
	super tearDown.
	newSuperclass3 ifNotNil: #removeFromSystem.
	newSuperclass2 ifNotNil: #removeFromSystem.
	newSuperclass ifNotNil: #removeFromSystem.
