calculating selectors
allSelectorsFor: aSelector
	| implementorsBody originalSelector selectorsBody afterSelector implementorsAfter selectorsAfter beforeSelector implementorsBefore selectorsBefore |
	originalSelector := self calculateOriginalSelector: aSelector.
	afterSelector := ('after_' , originalSelector) asSymbol.
	beforeSelector := ('before_' , originalSelector) asSymbol.

	implementorsBody := self linealizedImplementorsFor: originalSelector.
	implementorsAfter := self linealizedImplementorsFor: afterSelector.
	implementorsBefore := self linealizedImplementorsFor: beforeSelector.

	"If there is no implementation, i will explote!"
	implementorsBody ifEmpty: [ NotFound signalFor: aSelector ].

	selectorsBody := implementorsBody collect: [ :e | (e name , '___' , originalSelector) asSymbol ].
	selectorsAfter := implementorsAfter collect: [ :e | (e name , '___' , afterSelector) asSymbol ].
	selectorsBefore := implementorsBefore collect: [ :e | (e name , '___' , beforeSelector) asSymbol ].

	selectorsBefore ifEmpty: [ selectorsBody removeFirst ] ifNotEmpty: [ selectorsBefore removeFirst ].

	^ ({originalSelector} , selectorsBefore , selectorsBody , selectorsAfter) asOrderedCollection