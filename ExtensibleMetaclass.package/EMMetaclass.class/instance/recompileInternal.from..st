recompilation
recompileInternal: selector from: oldClass
	"Compile the method associated with selector in the receiver's method dictionary."

	| newMethod |
	newMethod := self compiler
				source: (oldClass sourceCodeAt: selector);
				class: self;
				failBlock: [^ self];
				compile.   "Assume OK after proceed from SyntaxError"

	self basicAddSelectorInternal: selector withMethod: newMethod.