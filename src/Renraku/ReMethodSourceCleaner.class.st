"
A source code cleaner
"
Class {
	#name : #ReMethodSourceCleaner,
	#superclass : #Object,
	#instVars : [
		'sourceLines',
		'cleanFinalDot'
	],
	#classVars : [
		'CleanFinalDotInMethodBody'
	],
	#category : #'Renraku-Utility'
}

{ #category : #testing }
ReMethodSourceCleaner class >> ableToClean: aCompiledMethod [

	^ (self clean: aCompiledMethod sourceCode) size ~= aCompiledMethod sourceCode size
]

{ #category : #cleaning }
ReMethodSourceCleaner class >> clean: aString [

	^(self forSource: aString)
		clean;
		contents
]

{ #category : #'settings - accessing' }
ReMethodSourceCleaner class >> cleanFinalDotInMethodBody [

	^ CleanFinalDotInMethodBody ifNil: [ CleanFinalDotInMethodBody := true ]
]

{ #category : #'settings - accessing' }
ReMethodSourceCleaner class >> cleanFinalDotInMethodBody: aBoolean [

	CleanFinalDotInMethodBody := aBoolean
]

{ #category : #settings }
ReMethodSourceCleaner class >> compactSourceCodeCleanupSettingsOn: aBuilder [
	<systemsettings>

	(aBuilder setting: #cleanFinalDotInMethodBody)
		order: 16;
		label: 'Clean the final dot in method body when critique is autofixed';
		description: 'Define if the system removes an unnecessary final dot at the end of a method body when critique on it is automatically resolved';
		parent: #qualityAssistant;
		default: true;
		target: self
]

{ #category : #'instance creation' }
ReMethodSourceCleaner class >> forSource: aString [

	^ self new
		initFromSource: aString;
		yourself
]

{ #category : #utilities }
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

{ #category : #accessing }
ReMethodSourceCleaner >> cleanFinalDot [

	^ cleanFinalDot
]

{ #category : #accessing }
ReMethodSourceCleaner >> cleanFinalDot: aBoolean [

	cleanFinalDot := aBoolean
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

{ #category : #initialization }
ReMethodSourceCleaner >> initialize [

	super initialize.
	self cleanFinalDot: self class cleanFinalDotInMethodBody
]

{ #category : #'private - operating' }
ReMethodSourceCleaner >> removeTrailingDot [

	 sourceLines last removeTrailingDot
]

{ #category : #'private - operating' }
ReMethodSourceCleaner >> removeTrailingSeparatorLines [

	[
	sourceLines isNotEmpty and: [
		sourceLines last onlyContainsSeparators ] ] whileTrue: [
		sourceLines removeLast ]
]

{ #category : #'private - operating' }
ReMethodSourceCleaner >> removeTrailingSeparatorsInAllLines [

	 sourceLines do: [:each | each removeTrailingSeparators ]
]
