compiling methods
sourceCodeAt: selector
	| donor newSelector pair |
	pair := self firstProviding: selector.

	(selector = #initializeTrait)
		ifTrue:[^ self myInitializeMethod sourceCode].

	donor := pair first.
	newSelector := pair second.

	"If the selector changed I am handling an initializer"
	(newSelector ~= selector) ifTrue:[
		^ self handleInitializer: selector for: donor.	
	].

	^ donor sourceCodeAt: newSelector.