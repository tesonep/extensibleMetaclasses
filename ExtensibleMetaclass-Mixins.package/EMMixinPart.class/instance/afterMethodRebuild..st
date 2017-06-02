compiling methods
afterMethodRebuild: targetClass
	targetClass clearSelectorsCache.
	super afterMethodRebuild: targetClass 