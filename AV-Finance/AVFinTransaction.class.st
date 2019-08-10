Class {
	#name : #AVFinTransaction,
	#superclass : #AVJournal,
	#instVars : [
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

{ #category : #initialization }
AVFinTransaction >> initializeAttributes [

	super initializeAttributes.

	amount := nil.
	comment := nil.
	receiver := nil.
	receiverAccount := nil.
	sender := nil.
	senderAccount := nil.
]
