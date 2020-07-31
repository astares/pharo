Extension { #name : #SmalltalkImage }

{ #category : #'*RPackage-Core' }
SmalltalkImage >> packages [

	^ (self packageOrganizer packages) sorted
]
