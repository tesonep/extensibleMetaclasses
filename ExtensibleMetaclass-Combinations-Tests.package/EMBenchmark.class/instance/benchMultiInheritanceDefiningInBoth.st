benchs
benchMultiInheritanceDefiningInBoth
	| obj |
	obj := newClass new.
	1 to: self problemSize do: [ :i | obj aMethod: 22 ]