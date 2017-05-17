as yet unclassified
innerWithArgs: arguments ifAbsent: aValuable
	^ self innerWithArgs: arguments ifAbsent: aValuable selector:(thisContext sender selector) below: (thisContext sender method methodClass).	