compiling methods
myInitializeMethod
	| sourceCode newMethod |
	
	sourceCode := TextStream on: (Text new: 400).
	
	sourceCode nextPutAll: 'initializeTrait'.
	sourceCode nextPut: Character cr.
	sourceCode nextPut: Character tab.
	sourceCode nextPutAll: 'self '.
	sourceCode nextPut: Character cr.

	sequence do:[ :e | 
			sourceCode nextPut: Character tab.
			sourceCode nextPut: Character tab.
			sourceCode nextPutAll: (self initializerFor: e).
			sourceCode nextPut: $;.
			sourceCode nextPut: Character cr.
		].
	
	sourceCode nextPut: Character tab.
	sourceCode nextPut: Character tab.
	sourceCode nextPutAll: 'yourself.'.
	sourceCode nextPut: Character cr.
		
	newMethod := self class compiler
				source: sourceCode contents asString;
				class: UndefinedObject;
				compile.   
				
	^ newMethod.
