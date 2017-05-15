selectors
selectorsWithoutInitializers
	^ (innerElement selectorsWithoutInitializers reject: [ :e | e = oldSelector ]) , {newSelector}