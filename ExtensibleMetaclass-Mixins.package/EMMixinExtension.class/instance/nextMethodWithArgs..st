as yet unclassified
nextMethodWithArgs: args
	| selector nextSelector |
	selector := thisContext sender selector.
	nextSelector := self class nextSelectorFor: selector.

	nextSelector ifNil: [ ^ self ].

	^ self perform: nextSelector withArguments: args