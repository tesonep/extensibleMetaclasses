accessing
allSelectorsInLinealization
	^ (self superclassLinealization flatCollect: #localSelectors) asSet