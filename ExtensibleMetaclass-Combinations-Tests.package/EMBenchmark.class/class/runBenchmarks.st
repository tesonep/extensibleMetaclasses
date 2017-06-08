defaults
runBenchmarks
	| running100 running500 ws normalValue |
	running100 := nil.
	running500 := nil.

	running100 := self run: 100.

	GTExampleOrganizer stop.
	Process allInstances
		select: [ :e | e name = 'GTExampleOrganizer >> #resetStubs' ]
		thenDo: #terminate.

	EpMonitor current disable.
	running100 := EMBenchmark run: 100.
	EpMonitor current enable.

	EpMonitor current disable.
	running500 := EMBenchmark run: 500.
	EpMonitor current enable.


	ws := (FileLocator home / 'tmp' / 'output1.csv') writeStream.
	ws truncate.
	EMCSVReporter
		reportFor: running100
		on: ws
		withFilter: [ :e | 
			#(SingleInheritanceDefiningInClass BetaDefiningInSuperclass TraitsDefiningInClass MultiInheritanceDefiningInClass)
				includes: e ].
	ws close.

	ws := (FileLocator home / 'tmp' / 'output2.csv') writeStream.
	ws truncate.
	EMCSVReporter
		reportFor: running100
		on: ws
		withFilter: [ :e | 
			#(MultiInheritanceDefiningInBothWithNextMethod SingleInheritanceDefiningInBothWithSuper BetaDefiningInBoth)
				includes: e ].
	ws close.


	(normalValue := ((running100 results at: #SingleInheritanceDefiningInClass)
		collect: [ :e | (e criteria at: 'total') totalTime ]) average) asFloat