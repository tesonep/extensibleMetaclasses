instance creation
newSubclass: aSubclassSymbol superClass: aSuperClass slots: slotDefinition classVariables: classVarDefinition poolDictionaries: someSharedPoolNames category: aCategorySymbol
	^ ShiftClassInstaller
		make: [ :builder | 
			builder
				metaclassClass: EMMetaclass;
				builderEnhancer: EMClassBuilderEnhancer new;
				name: aSubclassSymbol;
				superclass: aSuperClass;
				slots: slotDefinition;
				sharedVariables: classVarDefinition;
				sharedPools: someSharedPoolNames;
				category: aCategorySymbol ]