defaults
runBenchmarks
	| running100 running500 running1000 running10000 ws |
	running100 := nil.
	running500 := nil.

	running1000 := nil.
	running10000 := nil.

	[ running100 := EMBenchmark run: 100 ] timeToRun.
	[ running500 := EMBenchmark run: 500 ] timeToRun.	"0:00:01:05.708"

	[ running1000 := EMBenchmark run: 1000 ] timeToRun.
	[ running10000 := EMBenchmark run: 10000 ] timeToRun.


	ws := (FileLocator home / 'tmp' / 'output.csv') writeStream.
	EMCSVReporter reportFor: running100 on: ws.
	ws close.

	String streamContents: [ :s | EMCSVReporter reportFor: running100 on: s ]