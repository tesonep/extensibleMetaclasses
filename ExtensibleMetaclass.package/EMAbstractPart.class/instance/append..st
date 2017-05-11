parts relations
append: anotherPart
	nextPart := nextPart append: anotherPart.
	^ self.