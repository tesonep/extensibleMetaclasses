as yet unclassified
innerWithArgs: arguments ifAbsent: aValuable selector:aSelector below: aClass.	
	[ ^ self performBetaStyle: aSelector withArgs: arguments below: aClass ]
		on: NotFound
		do: [ ^ aValuable value ]