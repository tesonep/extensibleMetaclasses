accessing
compiledMethodAt: aSelector ifAbsent: aBlock
	^ myMethodDict at: aSelector ifAbsent: [ methodDict at: aSelector ifAbsent: aBlock]