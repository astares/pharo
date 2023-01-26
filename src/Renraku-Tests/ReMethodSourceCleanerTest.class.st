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
	^'dirtyMethod
	"Do not format this method - it by intention should include unnecessary spaces and a final dot"

	|temp|

	temp := 3 + 4'
]

{ #category : #'private - test data' }
ReMethodSourceCleanerTest >> dirtyMethod [
	"Do not format this method - it by intention should include unnecessary spaces and a final dot"  
	
	|temp| 
	 
	temp := 3 + 4.
	
	 

	
]

{ #category : #tests }
ReMethodSourceCleanerTest >> testCleanFinalDotIsEnabledByDefault [

	self assert: ReMethodSourceCleaner cleanFinalDotInMethodBody
]

{ #category : #tests }
ReMethodSourceCleanerTest >> testCleaning [

	| cleaned |
	cleaned := ReMethodSourceCleaner clean: (self class>>#dirtyMethod) sourceCode.
	self assert: cleaned equals: self cleanedMethodString
]

{ #category : #tests }
ReMethodSourceCleanerTest >> testFollowsSettingForCleaningFinalDotUponInstantiation [

	self
		assert: ReMethodSourceCleaner new cleanFinalDot
		equals: ReMethodSourceCleaner cleanFinalDotInMethodBody
]
