accessing
printOn: aStream
	aStream nextPutAll: 'EMAddedMethod('.
	selector printOn: aStream.
	aStream nextPutAll: ' from: '.
	contributingPart printOn: aStream.
	aStream nextPutAll: ')'