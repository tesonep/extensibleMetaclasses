accessing
printOn: aStream
	aStream nextPutAll: 'EMAddedMethod('.
	method selector printOn: aStream.
	aStream nextPutAll: ' from: '.
	contributingPart printOn: aStream.
	aStream nextPutAll: ')'