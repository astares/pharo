Class {
	#name : #ReCompactSourceCodeCritic,
	#superclass : #ReAbstractCritique,
	#category : #'Renraku-Utility'
}

{ #category : #'instance creation' }
ReCompactSourceCodeCritic class >> for: anEntity selector: aSelector by: aRule [
	^ (self for: anEntity by: aRule)
		tinyHint: aSelector;
		yourself
]

{ #category : #accessing }
ReCompactSourceCodeCritic >> change [
	| cm |
	cm := self sourceAnchor sourceEntity.

	^ (RBRefactoryChangeFactory instance)
		addMethodSource: (ReMethodSourceCleaner clean: cm sourceCode) in: cm methodClass
]

{ #category : #accessing }
ReCompactSourceCodeCritic >> providesChange [

	^ true
]
