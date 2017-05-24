as yet unclassified
after_aMethod: aStream
	aStream nextPutAll: 'after'.
	aStream nextPut: Character space.
	self nextMethodWithArgs: {aStream}