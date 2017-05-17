application
applyOn: aClass
	"I add the method to the class, without modifying the localSelectors.
	If there is a method with the same selector in the class, I do not do nothing."

	(aClass localSelectors includes: selector)
		ifTrue: [ ^ self ].

	aClass recompileInternal: selector from: contributingPart.
	(aClass lookupSelector: selector) propertyAt: #contributingPart put: contributingPart.
