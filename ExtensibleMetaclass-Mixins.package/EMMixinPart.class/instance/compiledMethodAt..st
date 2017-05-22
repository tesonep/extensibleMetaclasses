compiling methods
compiledMethodAt: aSelector
	self superclassLinealization do: [ :aClass | aClass methodDict at: aSelector ifPresent: [ :m | ^ m ] ].

	^ EMMixinExtension compiledMethodAt: aSelector