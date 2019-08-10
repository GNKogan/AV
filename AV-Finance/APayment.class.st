Class {
	#name : #APayment,
	#superclass : #Object,
	#instVars : [
		'amount'
	],
	#category : #'AV-Finance'
}

{ #category : #accessing }
APayment >> amount: anInteger [ 
	amount := anInteger
]
