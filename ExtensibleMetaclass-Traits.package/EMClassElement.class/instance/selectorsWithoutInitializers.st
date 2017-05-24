selectors
selectorsWithoutInitializers
	^ self selectors reject:[:e | e = #initializeTrait].