calculating elements
calculateMethodOperations: originalMethods for: aClass
	| extensionMethods |
	extensionMethods := (traitComposition selectors collect: [ :s | EMAddedMethod for: s from: self ]) asOrderedCollection.

	extensionMethods detect: [ :e | e selector = #initializeTrait ] ifNone: [ extensionMethods add: (EMAddedSyntheticMethod selector: #initializeTrait source: 'initializeTrait ' from: self) ].

	isMetaPart ifTrue:[
		extensionMethods , originalMethods detect:[:e | e selector = #new] ifNone:[ extensionMethods add:  (EMAddedSyntheticMethod selector: #new source: 'new 
					^ self basicNew 
							initialize;
							initializeTrait;
							yourself.	' from: self) ].	
	].

	^ super calculateMethodOperations: extensionMethods , originalMethods for: aClass