as yet unclassified
topMost: selector below: aClass
	(self withAllSuperclassesBelow: aClass)
		do: [ :c | c methodDict at: selector ifPresent: [ :m | ^ c ] ifAbsent: [  ] ].
		
	NotFound signalFor: selector.