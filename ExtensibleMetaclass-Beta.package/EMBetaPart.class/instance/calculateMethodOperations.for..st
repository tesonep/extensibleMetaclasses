calculating elements
calculateMethodOperations: originalMethods for: aClass
	| newOriginals |

	newOriginals := originalMethods
		collect: [ :m | 
			EMAddedSyntheticMethod
				selector: m selector
				source: (self betaInvocationFor: m selector)
				from: self ].

	^ super calculateMethodOperations: newOriginals for: aClass