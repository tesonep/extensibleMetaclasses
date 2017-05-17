as yet unclassified
innerIfAbsent: aValuable
	^ self innerWithArgs: #() ifAbsent: aValuable selector:(thisContext sender selector) below: (thisContext sender method methodClass).	