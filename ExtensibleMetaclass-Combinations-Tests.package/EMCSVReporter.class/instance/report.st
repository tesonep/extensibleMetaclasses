reporting
report
	| benchmarks iterations results matcher |
	benchmarks := runner results keys asOrderedCollection sort.
	filter ifNotNil:[ benchmarks := benchmarks select:filter].
	
	iterations := runner iterations.
	matcher := '([A-Z]([a-z]*))' asRegex.

	csvStream nextPut: (benchmarks collect: [ :b | (matcher matchesIn: b) joinUsing: ' ' ]).

	1 to: iterations do: [ :i | 
		results := OrderedCollection new: benchmarks size.
		benchmarks do: [ :aBenchmark | results add: (((runner results at: aBenchmark) at: i) criteria at: 'total') totalTime ].
		csvStream nextPut: results ].

	^ self