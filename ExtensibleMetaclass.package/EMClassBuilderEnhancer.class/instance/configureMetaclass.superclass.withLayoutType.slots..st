class modifications
configureMetaclass: newMetaclass superclass: superclass withLayoutType: aLayoutType slots: classSlots
	metaclassParts referedClass: newMetaclass.
	metaclassParts referedSuperclass: superclass.

	newMetaclass
		superclass: superclass
		withLayoutType: aLayoutType
		slots: (metaclassParts calculateSlots: classSlots) asArray.
	newMetaclass parts: metaclassParts.
	newMetaclass ensureLocalSelectors