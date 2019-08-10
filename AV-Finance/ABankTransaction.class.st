Class {
	#name : #ABankTransaction,
	#superclass : #AEntity,
	#instVars : [
		'sender',
		'senderAccount',
		'receiver',
		'receiverAccount',
		'amount',
		'currency',
		'description',
		'agreement',
		'docOrder',
		'bankStatement',
		'cost'
	],
	#category : #'AV-Finance'
}

{ #category : #importing }
ABankTransaction class >> import: aData [
	^ self new
		sender: (AJurPerson findByValues: aData sender);
		receiver: (AJurPerson findByValues: aData receiver);
		amount: aData amount;
		currency: aData currency;
		description: aData description
]

{ #category : #'as yet unclassified' }
ABankTransaction >> amount: aString [ 
	amount := aString
]

{ #category : #'as yet unclassified' }
ABankTransaction >> currency: aString [ 
	currency := aString
]

{ #category : #'as yet unclassified' }
ABankTransaction >> description: aString [ 
	description := aString
]

{ #category : #'as yet unclassified' }
ABankTransaction >> findAgreement [
	"comment stating purpose of message"

	self agreement: (AMatchingScoring new findAgreement: self)
]

{ #category : #'as yet unclassified' }
ABankTransaction >> receiver: aCollection [ 
	receiver := aCollection
]

{ #category : #'as yet unclassified' }
ABankTransaction >> sender: aCollection [ 
	sender := aCollection
]
