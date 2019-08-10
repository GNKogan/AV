Class {
	#name : #AEvent,
	#superclass : #Object,
	#instVars : [
		'date',
		'time'
	],
	#category : #'AV-Finance'
}

{ #category : #accessing }
AEvent >> date: aDate [ 
	date := aDate
]

{ #category : #initialization }
AEvent >> initialize [
	AWorld addEvent: self
]
