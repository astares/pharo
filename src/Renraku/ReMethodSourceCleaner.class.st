Class {
	#name : #ReMethodSourceCleaner,
	#superclass : #Object,
	#instVars : [
		'sourceLines'
	],
	#category : #'Renraku-Utility'
}

{ #category : #'private - initialization' }
ReMethodSourceCleaner class >> ableToClean: aCompiledMethod [

	^ (self clean: aCompiledMethod sourceCode) size ~= aCompiledMethod sourceCode size
]

{ #category : #'private - initialization' }
ReMethodSourceCleaner class >> forSource: aString [

	^ self new
		initFromSource: aString;
		yourself
]

{ #category : #'private - initialization' }
ReMethodSourceCleaner class >> showCleaningOf: aString [

	SpDiffPresenter new
 		showOptions: false;
		leftText: aString;
		rightText: (self clean: aString);
		open
]

{ #category : #operating }
ReMethodSourceCleaner >> clean [

	self
		removeTrailingSeparatorLines;
		removeTrailingDot;
		removeTrailingSeparatorsInAllLines
]

{ #category : #'private - initialization' }
ReMethodSourceCleaner >> clean: aString [

	^(self forSource: aString)
		clean;
		contents
]

{ #category : #accessing }
ReMethodSourceCleaner >> contents [

	^ String streamContents: [:s |
			sourceLines asArray do: [:each | s nextPutAll: each contents ] separatedBy: [ s nextPut: Character cr ]
	]
]

{ #category : #'private - initialization' }
ReMethodSourceCleaner >> initFromSource: aString [

	| lines |
	lines := aString lines withIndexCollect: [ :each :index |
		         ReSourceCodeLine lineNumber: index contents: each ].

	sourceLines := DoubleLinkedList new
		               addAll: lines;
		               yourself
]

{ #category : #accessing }
ReMethodSourceCleaner >> removeTrailingDot [

	 sourceLines last removeTrailingDot
]

{ #category : #accessing }
ReMethodSourceCleaner >> removeTrailingSeparatorLines [

	[
	sourceLines isNotEmpty and: [
		sourceLines last onlyContainsSeparators ] ] whileTrue: [
		sourceLines removeLast ]
]

{ #category : #accessing }
ReMethodSourceCleaner >> removeTrailingSeparatorsInAllLines [

	 sourceLines do: [:each | each removeTrailingSeparators ]
]
