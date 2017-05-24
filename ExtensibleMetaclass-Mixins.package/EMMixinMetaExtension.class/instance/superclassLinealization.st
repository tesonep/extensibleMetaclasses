accessing
superclassLinealization
	^ superclassLinealization ifNil: [ ^ {self baseClass superclass} ]