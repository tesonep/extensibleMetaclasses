as yet unclassified
innerWithArgs: arguments
	^ self innerWithArgs: arguments ifAbsent: self selector:(thisContext sender selector) below: (thisContext sender method methodClass).	