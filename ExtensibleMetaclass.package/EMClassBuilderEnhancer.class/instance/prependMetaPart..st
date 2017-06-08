parts relations
prependMetaPart: aPart
	aPart beMetaPart.
	metaclassParts := metaclassParts prepend: aPart