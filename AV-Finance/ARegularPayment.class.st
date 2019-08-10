Class {
	#name : #ARegularPayment,
	#superclass : #APayment,
	#instVars : [
		'period',
		'day'
	],
	#category : #'AV-Finance'
}

{ #category : #'as yet unclassified' }
ARegularPayment >> day: anInteger [ 
	day := anInteger
]

{ #category : #'as yet unclassified' }
ARegularPayment >> period: aString [ 
	period := aString
]
