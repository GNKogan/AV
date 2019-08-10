Class {
	#name : #AVCompanyTest,
	#superclass : #TestCase,
	#instVars : [
		'company'
	],
	#category : #'AV-Tests'
}

{ #category : #initialization }
AVCompanyTest >> setUp [
	"comment stating purpose of message"

	company := AVCompany new
]

{ #category : #tests }
AVCompanyTest >> testEmploy [
	"comment stating purpose of message"

	| person |
	person := AVPerson new.
	company employ: person
]
