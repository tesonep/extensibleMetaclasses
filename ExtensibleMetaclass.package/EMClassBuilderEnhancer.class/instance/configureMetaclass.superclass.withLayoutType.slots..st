class modifications
configureMetaclass: newMetaclass superclass: superclass withLayoutType: aLayoutType slots: classSlots
	newMetaclass superclass: superclass withLayoutType: aLayoutType slots: (metaclassParts calculateSlots: classSlots) asArray.
	newMetaclass parts: metaclassParts