accessing
selectorsCache
	^ selectorsCache ifNil:[ selectorsCache := IdentityDictionary new ].