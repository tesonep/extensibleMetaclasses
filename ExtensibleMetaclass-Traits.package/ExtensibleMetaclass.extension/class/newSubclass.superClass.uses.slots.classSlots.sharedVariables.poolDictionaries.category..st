*ExtensibleMetaclass-Traits
newSubclass: aSubclassSymbol superClass: aSuperClass uses: aTraitComposition slots: slotDefinition classSlots: classSlots sharedVariables: sharedVarDefinition poolDictionaries: someSharedPoolNames category: aCategorySymbol
	^ self
		newSubclass: aSubclassSymbol
		superClass: aSuperClass
		uses: aTraitComposition
		usesClassTrait: EMEmptyElement new 
		slots: slotDefinition
		classSlots: classSlots
		sharedVariables: sharedVarDefinition
		poolDictionaries: someSharedPoolNames
		category: aCategorySymbol
