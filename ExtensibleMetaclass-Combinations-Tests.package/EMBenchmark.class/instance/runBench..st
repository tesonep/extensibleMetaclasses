running
runBench: aBenchSelector
	self resources do: [ :each | each availableFor: self ].
	[ self setUp.
	^ self perform: aBenchSelector ]
		ensure: [ self tearDown.
			self cleanUpInstanceVariables ]