*ExtensibleMetaclass-Traits
new
	| obj |
	obj := self basicNew.
	obj initialize.
	(self canUnderstand: #initializeTrait)
		ifTrue: [ obj initializeTrait ].
	^ obj