compiling methods
sourceCodeAt: aSelector
	| aMethod |
	aMethod := self compiledMethodAt: aSelector.
	^ aMethod selector = aSelector
		ifTrue: [ aMethod sourceCode ]
		ifFalse: [ aMethod getSourceReplacingSelectorWith: aSelector ]