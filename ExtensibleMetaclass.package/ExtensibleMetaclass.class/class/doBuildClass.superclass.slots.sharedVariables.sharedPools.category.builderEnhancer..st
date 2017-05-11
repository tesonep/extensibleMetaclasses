instance creation
doBuildClass: aSubclassSymbol superclass: aSuperClass slots: slotDefinition sharedVariables: classVarDefinition sharedPools: someSharedPoolNames category: aCategorySymbol builderEnhancer: builderEnhancer
	^ ShiftClassInstaller
		make: [ :builder | 
			builder
				metaclassClass: EMMetaclass;
				builderEnhancer: builderEnhancer;
				name: aSubclassSymbol;
				superclass: aSuperClass;
				slots: slotDefinition;
				sharedVariables: classVarDefinition;
				sharedPools: someSharedPoolNames;
				category: aCategorySymbol;
				copyClassSlotsFromExistingClass ]