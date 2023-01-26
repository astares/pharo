Class {
	#name : #ReExceptionStrategyTest,
	#superclass : #TestCase,
	#category : #'Renraku-Tests-Utilities'
}

{ #category : #tests }
ReExceptionStrategyTest >> testSettingDescription [

	ReExceptionStrategy allSubclassesDo: [ :strategy |
		self assert: (
			ReExceptionStrategy settingDescription
				includesSubstring: strategy strategyDescription) ]
]
