running
runBenchs
	| results |
	" 
		self new runBenchs 
	"
	results := Dictionary new.

	(self class allSelectors select: [ :e | e beginsWith: 'bench' ]) do: [ :e | results at: e put: (self runBench: e) ] displayingProgress: [ :e | e ].

	^ results