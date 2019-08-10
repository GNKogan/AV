Class {
	#name : #AVEvent,
	#superclass : #AVJournal,
	#instVars : [
		'datetime',
		'user',
		'subject',
		'object',
		'action'
	],
	#category : #AV
}

{ #category : #'as yet unclassified' }
AVEvent class >> register: aMessage [
	"comment stating purpose of message"

	Transcript show: aMessage, DateAndTime today asString; cr.
]

{ #category : #initialization }
AVEvent >> initialize [

	super initialize.

	action := nil.
	datetime := nil.
	object := nil.
	subject := nil.
	user := nil.
]
