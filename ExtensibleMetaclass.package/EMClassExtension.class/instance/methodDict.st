accessing method dictionary
methodDict
	^ myMethodDict ifNil: [ myMethodDict := MethodDictionary new ]