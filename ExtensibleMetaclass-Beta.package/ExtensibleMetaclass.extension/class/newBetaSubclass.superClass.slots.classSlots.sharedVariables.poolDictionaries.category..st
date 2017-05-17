*ExtensibleMetaclass-Beta
newBetaSubclass: aSubclassSymbol superClass: aSuperClass slots: slotDefinition classSlots: classSlots sharedVariables: sharedVarDefinition poolDictionaries: someSharedPoolNames category: aCategorySymbol
	| builderEnhancer |
	builderEnhancer := self defaultBuilderEnhancer.
	builderEnhancer
		prependPart: EMBetaPart new;
		prependMetaPart: EMBetaMetaPart new.

	^ self
		doBuildClass: aSubclassSymbol
		superclass: aSuperClass
		slots: slotDefinition
		classSlots: classSlots
		sharedVariables: sharedVarDefinition
		sharedPools: someSharedPoolNames
		category: aCategorySymbol
		builderEnhancer: builderEnhancer