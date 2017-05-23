compiling methods
compiledMethodAt: aSelector
	| parts className originalSelector provider |
	self superclassLinealization do: [ :aClass | aClass methodDict at: aSelector ifPresent: [ :m | ^ m ] ].
	EMMixinExtension methodDict at: aSelector ifPresent: [ :m | ^ m ].
	
	parts := aSelector splitOn: '___'.
	
	(parts size ~= 2) ifTrue:[NotFound signalFor: aSelector].
	
	className := (parts at: 1) asSymbol.
	originalSelector := (parts at: 2) asSymbol.
	
	provider := self superclassLinealization detect: [ :e | e name = className ] ifNone: [NotFound signalFor: aSelector].
	^ provider compiledMethodAt: originalSelector
