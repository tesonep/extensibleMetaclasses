*ExtensibleMetaclass-Traits
newSubclass: aSubclassSymbol superClass: aSuperClass uses: aTraitComposition usesClassTrait: aMetaTraitComposition slots: slotDefinition classSlots: classSlots sharedVariables: sharedVarDefinition poolDictionaries: someSharedPoolNames category: aCategorySymbol
	| builderEnhancer |
	builderEnhancer := self defaultBuilderEnhancer.
	builderEnhancer
		appendPart: (EMTraitPart for: aTraitComposition asEMTraitComposition);
		appendMetaPart: (EMTraitPart for: aMetaTraitComposition asEMTraitComposition).

	^ self
		doBuildClass: aSubclassSymbol
		superclass: aSuperClass
		slots: slotDefinition
		classSlots: classSlots
		sharedVariables: sharedVarDefinition
		sharedPools: someSharedPoolNames
		category: aCategorySymbol
		builderEnhancer: builderEnhancer