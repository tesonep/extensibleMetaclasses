reporting
reportFor: aRunner on: aStream withFilter: aBlock
	| reporter |
	reporter := self new.
	reporter runner: aRunner.
	reporter outputStream: aStream.
	reporter filter: aBlock.
	reporter report.
	^ reporter.