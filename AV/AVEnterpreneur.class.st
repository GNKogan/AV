Class {
	#name : #AVEnterpreneur,
	#superclass : #AVJuridicalPerson,
	#instVars : [
		'person'
	],
	#category : #AV
}

{ #category : #'as yet unclassified' }
AVEnterpreneur >> initializeAttributes [
	"comment stating purpose of message"

	super initializeAttributes.
	
	person := AVPerson new.
	inn := person inn.
	
	_attribs at: (self class instVarIndexFor: #person) put: #person.
	
]
