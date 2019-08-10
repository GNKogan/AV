Class {
	#name : #AVSession,
	#superclass : #Object,
	#instVars : [
		'storage',
		'currentLogin'
	],
	#category : #'AV-Storage'
}

{ #category : #'as yet unclassified' }
AVSession class >> forLogin: aLogin [
	"comment stating purpose of message"

	^ self new: aLogin
]

{ #category : #'as yet unclassified' }
AVSession >> new: aLogin [
	"comment stating purpose of message"

	self new.
	currentLogin := aLogin
	
]
