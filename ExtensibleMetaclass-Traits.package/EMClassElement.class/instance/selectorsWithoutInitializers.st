selectors
selectorsWithoutInitializers
	^ innerClass localSelectors reject:[:e | e = #initializeTrait].