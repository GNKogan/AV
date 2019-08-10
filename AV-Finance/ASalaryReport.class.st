Class {
	#name : #ASalaryReport,
	#superclass : #AReport,
	#instVars : [
		'workdays',
		'daysoff'
	],
	#category : #'AV-Finance'
}

{ #category : #initialization }
ASalaryReport >> setUp: aData [
	"comment stating purpose of message"

	workdays := aData at: #days.
	daysoff := aData at: #daysoff.
]
