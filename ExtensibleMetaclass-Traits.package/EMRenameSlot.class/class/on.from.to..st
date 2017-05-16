initialization
on: anElement from: oldName to: newName
	^ self new
		innerElement: anElement;
		oldName: oldName;
		newName: newName;
		yourself