Class {
	#name : #ReCompactSourceCodeRule,
	#superclass : #ReAbstractRule,
	#category : #'Renraku-Utility'
}

{ #category : #testing }
ReCompactSourceCodeRule class >> checksMethod [

	^ true
]

{ #category : #running }
ReCompactSourceCodeRule >> basicCheck: aMethod [

	^ ReMethodSourceCleaner ableToClean: aMethod
]

{ #category : #running }
ReCompactSourceCodeRule >> change [

	^' '
]

{ #category : #running }
ReCompactSourceCodeRule >> check: aMethod forCritiquesDo: aCriticBlock [

	(self basicCheck: aMethod)
		ifTrue: [
			aCriticBlock cull: (
				ReCompactSourceCodeCritic
					for: aMethod
					by: self)  ]
]

{ #category : #running }
ReCompactSourceCodeRule >> group [

	^ 'Clean Code'
]

{ #category : #running }
ReCompactSourceCodeRule >> name [

	^ 'Unnecessary separators or final dots found in method body'
]

{ #category : #running }
ReCompactSourceCodeRule >> providesChange [

	^ true
]
