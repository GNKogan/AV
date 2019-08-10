Class {
	#name : #AHourlyPayment,
	#superclass : #AEmployeePayment,
	#instVars : [
		'rate'
	],
	#category : #'AV-Finance'
}

{ #category : #accessing }
AHourlyPayment >> rate [
	^ rate
]

{ #category : #accessing }
AHourlyPayment >> rate: aString [ 
	rate := aString asInteger
]

{ #category : #accessing }
AHourlyPayment >> total [
	^ self total: 160
]

{ #category : #accessing }
AHourlyPayment >> total: aNumber [
	^ rate * aNumber.
]
