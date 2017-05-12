accessing
methods
	^ (innerClass allSelectorsBelow: Object) collect: [ :selector | innerClass >> selector ]