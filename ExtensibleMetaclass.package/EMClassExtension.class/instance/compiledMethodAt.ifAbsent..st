accessing
compiledMethodAt: aSelector ifAbsent: aBlock
	^ self methodDict at: aSelector ifAbsent: [ self hiddenMethodDict at: aSelector ifAbsent: aBlock]
