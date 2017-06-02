calculating selectors
calculateAllSelectorFor: aSelector
	| allSelectors |
	allSelectors := self allSelectorsFor: aSelector.
	allSelectors overlappingPairsDo: [ :caller :callee | self selectorsCache at: caller put: callee ].
	allSelectors ifNotEmpty: [ self selectorsCache at: allSelectors last put: nil ]