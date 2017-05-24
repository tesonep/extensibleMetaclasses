calculating selectors
nextSelectorFor: aSelector
	| allSelectors index |
	allSelectors := self allSelectorsFor: aSelector.
	index := allSelectors indexOf: aSelector.
	allSelectors removeFirst: index.
	
	allSelectors ifEmpty: [ ^nil ].
	^ allSelectors first 