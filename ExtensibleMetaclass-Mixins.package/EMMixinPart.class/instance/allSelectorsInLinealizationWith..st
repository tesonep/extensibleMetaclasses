accessing
allSelectorsInLinealizationWith: originalMethods
	^ ((self superclassLinealization flatCollect: #localSelectors) , (originalMethods collect: #selector)) asSet reject: [ :e | (e beginsWith: 'before_') or: [ e beginsWith: 'after_' ] ]