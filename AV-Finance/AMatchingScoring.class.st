Class {
	#name : #AMatchingScoring,
	#superclass : #AMatchingModel,
	#instVars : [
		'score'
	],
	#category : #'AV-Finance'
}

{ #category : #adding }
AMatchingScoring >> addScore: anInteger [
	^ self score * anInteger
]

{ #category : #'as yet unclassified' }
AMatchingScoring >> findAgreement: aTransaction [

	| variants |
	variants := AAgreement findByParties: aTransaction sender and: aTransaction receiver.
	variants do: [ :each | self score: each for: aTransaction ].
	variants sort: [ score ].
	^ variants first
]

{ #category : #initialization }
AMatchingScoring >> initializeScore [
	self score: 1
]

{ #category : #accessing }
AMatchingScoring >> score [
	^ score
]

{ #category : #accessing }
AMatchingScoring >> score: anInteger [
	score := anInteger 
]

{ #category : #'as yet unclassified' }
AMatchingScoring >> score: anAgreement for: aTransaction [
	
	self initializeScore.
	aTransaction sender = anAgreement party2 ifTrue: [ self addScore: 1000 ] ifFalse: [ self addScore: 10 ].
	aTransaction date < anAgreement date ifTrue: [ self addScore: 0 ].
	anAgreement dateFinish isNotNil & aTransaction date < anAgreement dateFinish + anAgreement period ifTrue: [ self addScore: 100 ].
	^ self score
]
