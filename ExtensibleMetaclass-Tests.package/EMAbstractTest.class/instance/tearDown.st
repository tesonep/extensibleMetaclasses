running
tearDown
	newClass ifNotNil: #removeFromSystem.
	newClass := nil.
	
	newClass2 ifNotNil: #removeFromSystem.
	newClass2 := nil.
	
	super tearDown