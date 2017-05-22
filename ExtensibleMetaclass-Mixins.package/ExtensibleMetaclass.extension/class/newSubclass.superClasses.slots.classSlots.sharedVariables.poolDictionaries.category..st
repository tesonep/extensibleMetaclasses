*ExtensibleMetaclass-Mixins
newSubclass: aSubclassSymbol superClasses: superclasses slots: slotDefinition classSlots: classSlots sharedVariables: sharedVarDefinition poolDictionaries: someSharedPoolNames category: aCategorySymbol

	| builderEnhancer |
	builderEnhancer := self defaultBuilderEnhancer.
	builderEnhancer
		appendPart: (EMMixinPart for: superclasses).
	builderEnhancer
		appendMetaPart: (EMMixinMetaPart new).

	^ self
		doBuildClass: aSubclassSymbol
		superclass: Object
		slots: slotDefinition
		classSlots: classSlots
		sharedVariables: sharedVarDefinition
		sharedPools: someSharedPoolNames
		category: aCategorySymbol
		builderEnhancer: builderEnhancer