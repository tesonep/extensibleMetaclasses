selectors
selectorsWithoutInitializers
	^ innerElement selectorsWithoutInitializers reject: [ :e | e = removedSelector ]