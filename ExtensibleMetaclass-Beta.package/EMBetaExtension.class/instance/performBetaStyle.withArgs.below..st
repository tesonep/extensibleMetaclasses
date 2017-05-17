as yet unclassified
performBetaStyle: selector withArgs: args below: aClass
	| definingClass method |
	definingClass := self class topMost: selector below: aClass.
	method := definingClass >> selector.
	^ self withArgs: args executeMethod: method.