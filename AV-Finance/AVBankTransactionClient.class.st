Class {
	#name : #AVBankTransactionClient,
	#superclass : #AVBankTransaction,
	#category : #'AV-Finance'
}

{ #category : #'as yet unclassified' }
AVBankTransactionClient class >> idAttributeName [
	"comment stating purpose of message"

	^'num1c'
]

{ #category : #initialization }
AVBankTransactionClient >> set: aData with: additionalData [
	"comment stating purpose of message"

	({'62.1'. '62.2'. '76.5'} includes: (aData at: 'account')) ifFalse: [ self error: 'Wrong account for client transaction' ].
	(aData at: 'outcome') = 0 ifFalse: [ self error: 'Wrong client transaction with not null outcome' ].

	super set: aData with: additionalData.

	self set: #receiver to: (additionalData at: 'company').
	"self set: #receiverAccount to: (additionalData at: 'company')."
	self set: #sender to: ((additionalData at: 'storage') bindedEntityWith: (aData at: 's1code') for: 'Контрагенты').
	self set: #deal to: (aData at: 's2code').	"doc2"
	self set: #amount to: (aData at: 'income').

]
