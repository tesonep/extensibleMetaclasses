tests
tearDown	
	super tearDown.
	newSuperclass ifNotNil:#removeFromSystem.
	newSuperclass2 ifNotNil:#removeFromSystem.
	newSuperclass3 ifNotNil:#removeFromSystem	
