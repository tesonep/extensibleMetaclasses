application
applyOn: aClass
	"I add the method to the class, without modifying the localSelectors.
	If there is a method with the same selector in the class, I do not do nothing."

	(aClass localSelectors includes: method selector)
		ifTrue: [ ^ self ].

	aClass recompile: method selector from: contributingPart.
	aClass >> method selector propertyAt: #contributingPart put: contributingPart.
