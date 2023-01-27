"
Please describe the package using the class comment of the included manifest class. The manifest class also includes other additional metadata for the package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestRenrakuTests,
	#superclass : #PackageManifest,
	#category : #'Renraku-Tests-Manifest'
}

{ #category : #'code-critics' }
ManifestRenrakuTests class >> ruleReCompactSourceCodeRuleV1FalsePositive [
	^ #(#(#(#RGClassDefinition #(#ReMethodSourceCleanerTest)) #'2023-01-26T18:27:46.601134+01:00') )
]

{ #category : #'code-critics' }
ManifestRenrakuTests class >> ruleRefersToClassRuleV1FalsePositive [
	^ #(#(#(#RGClassDefinition #(#ReMethodSourceCleanerTest)) #'2023-01-27T08:17:56.199057+01:00') )
]
