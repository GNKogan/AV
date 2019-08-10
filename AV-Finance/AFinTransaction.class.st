Class {
	#name : #AFinTransaction,
	#superclass : #AEvent,
	#instVars : [
		'base',
		'sender',
		'senderAccount',
		'receiver',
		'receiverAccount',
		'amount',
		'currency',
		'comment',
		'agreement'
	],
	#category : #'AV-Finance'
}

{ #category : #'instance creation' }
AFinTransaction class >> newByAgreement: anAgreement [
	^ self new initializeByAgreement: anAgreement; yourself
]

{ #category : #'instance creation' }
AFinTransaction class >> newByAgreement: anAgreement date: aDate amount: aNumber [
	^ (self newByAgreement: anAgreement) date: aDate; amount: aNumber; yourself
]

{ #category : #'as yet unclassified' }
AFinTransaction >> agreement: aAgreement [ 
	agreement := aAgreement
]

{ #category : #'as yet unclassified' }
AFinTransaction >> amount: aNumber [ 
	amount := aNumber
]

{ #category : #initialization }
AFinTransaction >> initializeByAgreement: anAgreement [
	self agreement: anAgreement.
	self sender: anAgreement party1.
	self receiver: anAgreement party2.
	^ self
]

{ #category : #'as yet unclassified' }
AFinTransaction >> receiver: anObject [ 
	receiver := anObject
]

{ #category : #'as yet unclassified' }
AFinTransaction >> sender: anObject [ 
	sender := anObject
]
