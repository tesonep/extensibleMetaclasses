instance creation
newSubclass: aSubclassSymbol superClass: aSuperClass slots: slotDefinition classSlots: classSlots sharedVariables: sharedVarDefinition poolDictionaries: someSharedPoolNames category: aCategorySymbol
	^ self
		doBuildClass: aSubclassSymbol
		superclass: aSuperClass
		slots: slotDefinition
		classSlots: classSlots
		sharedVariables: sharedVarDefinition
		sharedPools: someSharedPoolNames
		category: aCategorySymbol
		builderEnhancer: self defaultBuilderEnhancer