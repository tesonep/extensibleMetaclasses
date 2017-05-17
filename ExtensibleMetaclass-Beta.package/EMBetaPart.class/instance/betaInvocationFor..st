calculating elements
betaInvocationFor: aSelector
	^ String streamContents: [ :s |
		s nextPutAll: aSelector asMethodPreamble;
		nextPut: Character cr;
		nextPutAll: '^ self performBetaStyle: (thisContext selector) withArgs: (thisContext arguments) below: Object'
	] 
	
	