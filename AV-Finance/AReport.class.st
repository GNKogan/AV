Class {
	#name : #AReport,
	#superclass : #Object,
	#instVars : [
		'data',
		'agreement',
		'period'
	],
	#category : #'AV-Finance'
}

{ #category : #'as yet unclassified' }
AReport >> agreement: anAJobAgreement [ 
	agreement := anAJobAgreement
]

{ #category : #'as yet unclassified' }
AReport >> period [
	^ period
]

{ #category : #'as yet unclassified' }
AReport >> period: aString [ 
	period := aString
]

{ #category : #initialization }
AReport >> setUp: aData [
	"comment stating purpose of message"

	self shouldBeImplemented 
]
