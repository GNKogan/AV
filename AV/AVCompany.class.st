Class {
	#name : #AVCompany,
	#superclass : #AVLegalPerson,
	#instVars : [
		'num',
		'email',
		'phone',
		'producer',
		'contact',
		'persons',
		'holding',
		'employees'
	],
	#category : #AV
}

{ #category : #'as yet unclassified' }
AVCompany >> employ: aPerson [
	"comment stating purpose of message"

	| job |
	job := AVJob new company: self; person: aPerson.
	self employees add: job.
	aPerson jobs add: job
]

{ #category : #'as yet unclassified' }
AVCompany >> employees [
	^ employees
]

{ #category : #initialization }
AVCompany >> initializeAttributes [
	"comment stating purpose of message"

	super initializeAttributes.
	num := AVString new.
	email := AVString new.
	phone := AVString new.
	producer := AVString new.
	contact := AVString new.
	persons := Dictionary new.
	holding := AVString new.

	employees := OrderedCollection new.
		
	_attribs at: (self class instVarIndexFor: #num) put: #num.

]
