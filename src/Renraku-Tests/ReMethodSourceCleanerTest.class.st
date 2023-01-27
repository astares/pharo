"
An ALSourceCleanerTest is a test class for testing the behavior of ALSourceCleaner
"
Class {
	#name : #ReMethodSourceCleanerTest,
	#superclass : #TestCase,
	#category : #'Renraku-Tests-Utilities'
}

{ #category : #'private - test data' }
ReMethodSourceCleanerTest >> cleanedMethodString [
	^'dirtyMethodWithUnnecessarySpacesAndFinalDot
	"Do not format this method - it by intention should include unnecessary spaces and a final dot"

	|temp|

	temp := 3 + 4'
]

{ #category : #'private - test data' }
ReMethodSourceCleanerTest >> cleanedMethodStringKeepingDot [
	^'dirtyMethodWithUnnecessarySpacesAndFinalDot
	"Do not format this method - it by intention should include unnecessary spaces and a final dot"

	|temp|

	temp := 3 + 4.'
]

{ #category : #'private - test data' }
ReMethodSourceCleanerTest >> dirtyMethodWithUnnecessarySpacesAndFinalDot [
	"Do not format this method - it by intention should include unnecessary spaces and a final dot"  
	
	|temp| 
	 
	temp := 3 + 4.
	
	 

	
]

{ #category : #'tests - cleaning' }
ReMethodSourceCleanerTest >> testCleaning [

	| cleaned method |
	method := ReMethodSourceCleanerTest >> #dirtyMethodWithUnnecessarySpacesAndFinalDot.
	cleaned := ReMethodSourceCleaner clean: method sourceCode.
	self assert: cleaned equals: self cleanedMethodString
]

{ #category : #'tests - cleaning' }
ReMethodSourceCleanerTest >> testCleaningKeepingDot [

	| cleaned |
	cleaned := ReMethodSourceCleaner clean: (ReMethodSourceCleanerTest>>#dirtyMethodWithUnnecessarySpacesAndFinalDot) sourceCode keepFinalDot: true.
	self assert: cleaned equals: self cleanedMethodStringKeepingDot
]

{ #category : #'tests - settings' }
ReMethodSourceCleanerTest >> testFollowsSettingForCleaningFinalDotUponInstantiation [

	self
		assert: ReMethodSourceCleaner new keepFinalDot
		equals: ReMethodSourceCleaner keepFinalDotInMethodBody
]

{ #category : #'tests - settings' }
ReMethodSourceCleanerTest >> testKeepFinalDotIsDisabledByDefault [

	self assert: ReMethodSourceCleaner keepFinalDotInMethodBody equals: false
 	
]
