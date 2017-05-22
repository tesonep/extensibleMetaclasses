accessing
superclassLinealization
	^ superclassLinealization ifNil: [ superclassLinealization := self calculateLinealization ]