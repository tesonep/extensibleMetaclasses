rewriting
doRewriteNextMethodCall: aMethod parentName: parentName
	| newSource parseTree rewriteString |
	parseTree := RBParser parseMethod: aMethod source.

	rewriteString := String
		streamContents: [ :stream | 
			stream nextPutAll: 'self '.

			parentName endsWithAColon
				ifTrue: [ parentName keywords
						withIndexDo: [ :each :i | 
							stream
								nextPutAll: each;
								nextPutAll: ' (``@args at: ';
								nextPutAll: i printString;
								nextPutAll: ') ' ] ]
				ifFalse: [ stream nextPutAll: parentName asString ] ].

	newSource := (RBParseTreeRewriter new
		replace: 'self nextMethodWithArgs: ``@args' with: rewriteString;
		executeTree: parseTree;
		tree) formattedCode.
		
	^ EMAddedSyntheticMethod selector: aMethod selector source: newSource from: aMethod contributingPart