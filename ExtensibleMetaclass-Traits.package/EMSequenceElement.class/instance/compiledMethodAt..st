compiling methods
compiledMethodAt: selector
	| donor newSelector pair|

	(selector = #initializeTrait)
		ifTrue:[^ self myInitializeMethod].
	
	pair := self firstProviding: selector.
	donor := pair first.
	newSelector := pair second.

	^ donor compiledMethodAt: newSelector.