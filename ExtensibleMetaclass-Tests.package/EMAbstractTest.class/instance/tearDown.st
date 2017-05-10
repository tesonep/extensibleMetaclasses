running
tearDown
	newClass ifNotNil: #removeFromSystem.
	newClass := nil.
	super tearDown