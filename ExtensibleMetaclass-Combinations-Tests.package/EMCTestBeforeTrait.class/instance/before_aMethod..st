as yet unclassified
before_aMethod: aStream
	aStream nextPutAll: 'before'.
	aStream nextPut: Character space.
	self nextMethodWithArgs: {aStream}