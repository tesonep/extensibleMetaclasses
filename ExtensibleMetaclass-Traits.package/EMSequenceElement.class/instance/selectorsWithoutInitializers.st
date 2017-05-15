selectors
selectorsWithoutInitializers
	^ sequence flatCollect: [ :e | e selectorsWithoutInitializers ]