compiling
compileMethodsFor: aBuilder
	aBuilder oldClass localSelectors
		do: [ :sel | 
			aBuilder newClass recompile: sel from: aBuilder oldClass.
			aBuilder newClass registerLocalSelector: sel ].

	aBuilder oldClass theMetaClass localSelectors
		do: [ :sel | 
			aBuilder newClass theMetaClass recompile: sel from: aBuilder oldClass theMetaClass.
			aBuilder newClass theMetaClass registerLocalSelector: sel ]