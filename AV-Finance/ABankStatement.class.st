Class {
	#name : #ABankStatement,
	#superclass : #AEntity,
	#instVars : [
		'date',
		'account',
		'currency',
		'income',
		'outcome',
		'balanceOpening',
		'balanceClosing',
		'strings'
	],
	#category : #'AV-Finance'
}

{ #category : #'instance creation' }
ABankStatement class >> newFrom: aData [
"account currency income outcome balanceOpening balanceClosing strings"
	^ self new
		account: aData account;
		date: aData date;
		income: aData income;
		outcome: aData outcome
]

{ #category : #accessing }
ABankStatement >> account: aString [ 
	"account := aString"

	(aString isKindOf: ABankAccount)
		ifTrue: [ account := aString ]
		ifFalse: [ account := ABankAccount newFrom: aString ]
]
