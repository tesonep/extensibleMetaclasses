accessing
rebuildMethodDictionary
	localSelectors ifNil: [ localSelectors := self localSelectors ].
	
	EMClassExtension localSelectors do:[:selector | 
		(localSelectors includes: selector) ifFalse:[
			self recompile: selector from: EMClassExtension.
			self >> selector propertyAt: #classProviding put: EMClassExtension.
		]
	].
