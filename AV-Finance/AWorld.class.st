Class {
	#name : #AWorld,
	#superclass : #Object,
	#classVars : [
		'agreements',
		'employs',
		'events',
		'objects'
	],
	#category : #'AV-Finance'
}

{ #category : #adding }
AWorld class >> add: anEntity [
	objects add: anEntity
]

{ #category : #adding }
AWorld class >> addAgreement: anAgreement [
	"comment stating purpose of message"

	agreements add: anAgreement
]

{ #category : #'as yet unclassified' }
AWorld class >> addEvent: anEvent [ 
	events add: anEvent
]

{ #category : #adding }
AWorld class >> addJobAgreement: aJobAgreement [
	"comment stating purpose of message"

	employs add: aJobAgreement
]

{ #category : #'as yet unclassified' }
AWorld class >> agreements [
	self shouldBeImplemented.
]

{ #category : #'as yet unclassified' }
AWorld class >> employs [
	^ employs
]

{ #category : #'as yet unclassified' }
AWorld class >> events [
	^ events
]

{ #category : #initialization }
AWorld class >> initialize [
	"comment stating purpose of message"

	objects := OrderedCollection new.
	events := OrderedCollection new.
	employs := OrderedCollection new.
	agreements := OrderedCollection new.
]

{ #category : #'as yet unclassified' }
AWorld class >> objects [
	^ objects
]

{ #category : #removing }
AWorld class >> remove: aClass [
	objects do: [ :each | (each isKindOf: aClass) ifTrue: [ objects remove: each ] ].
	3 timesRepeat: [ Smalltalk garbageCollect  ]
]
