application
applyOn: aClass
	| newMethod |
	newMethod := aClass compiler
				source: source;
				class: aClass;
				failBlock: [^ self];
				compile.   "Assume OK after proceed from SyntaxError"

	aClass basicAddSelectorInternal: selector withMethod: newMethod.