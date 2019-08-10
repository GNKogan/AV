Class {
	#name : #ABrowser,
	#superclass : #Object,
	#instVars : [
		'browser'
	],
	#category : #'AV-Finance'
}

{ #category : #'instance creation' }
ABrowser class >> open [
	"comment stating purpose of message"

	^ self new open
]

{ #category : #building }
ABrowser >> buildBrowser [
	"comment stating purpose of message"

	self subclassResponsibility
]

{ #category : #'instance creation' }
ABrowser >> open [
	"comment stating purpose of message"

	self buildBrowser.
	browser openOn: self organizer
]

{ #category : #querying }
ABrowser >> organizer [
	"comment stating purpose of message"

	self subclassResponsibility
]
