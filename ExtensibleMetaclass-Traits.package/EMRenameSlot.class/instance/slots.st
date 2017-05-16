accessing
slots
	^ innerElement slots
		collect: [ :e | 
			| slot |
			slot := e asSlot.
			slot name = oldName
				ifTrue: [ slot copy name: newName ]
				ifFalse: [ slot ] ]