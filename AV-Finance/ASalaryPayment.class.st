Class {
	#name : #ASalaryPayment,
	#superclass : #AEmployeePayment,
	#instVars : [
		'bonuses'
	],
	#category : #'AV-Finance'
}

{ #category : #initialization }
ASalaryPayment >> initialize [
	bonuses := OrderedCollection new
]

{ #category : #accessing }
ASalaryPayment >> total [
	"comment stating purpose of message"

	^ salary * (1 + bonuses sumNumbers: [ :a | a/100 ])
]
