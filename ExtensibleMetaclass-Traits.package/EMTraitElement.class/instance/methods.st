accessing
methods
	^ (traitClass allSelectorsBelow: Object) collect: [ :selector | traitClass >> selector ]