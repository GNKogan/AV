Class {
	#name : #AVBankStatement,
	#superclass : #AVDocument,
	#instVars : [
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

{ #category : #'as yet unclassified' }
AVBankStatement class >> class1s [
	"comment stating purpose of message"

	^ 'Выписка'
]

{ #category : #'as yet unclassified' }
AVBankStatement class >> idAttributeName [
	"comment stating purpose of message"

	^'num1c'
]

{ #category : #initialization }
AVBankStatement >> set: aData [
	"comment stating purpose of message"
"status:
0 - default, means incomplete entity or internal error
1 - active/existed
2 - deleted
3 - inactive (for journals, непроведённый)"
"1C:
1 - active: 1, delmark: 0
2 - active: 0, delmark: 1
3 - active: 0, delmark: 0"
	self set: #status to: 3 - ((aData at: 'active') asInteger * 2) - (aData at: 'delmark') asInteger.

	self set: #date to: (aData at: 'date1c').
	self set: #num to: (aData at: 'num1c').

	self set: #currency to: (aData at: 'currency').
	self set: #income to: (aData at: 'income').
	self set: #outcome to: (aData at: 'outcome').

"ПервичныйДокумет = п/п, ДокументПоставки = Сделка"
]

{ #category : #initialization }
AVBankStatement >> set: aData with: additionalData [
	"comment stating purpose of message"
"status:
0 - default, means incomplete entity or internal error
1 - active/existed
2 - deleted
3 - inactive (for journals, непроведённый)"
"1C:
1 - active: 1, delmark: 0
2 - active: 0, delmark: 1
3 - active: 0, delmark: 0"
	self set: #status to: 3 - ((aData at: 'active') asInteger * 2) - (aData at: 'delmark') asInteger.

	self set: #date to: (Date readFrom: (aData at: 'date1c') pattern: 'yymmdd').
	self set: #num to: (aData at: 'num1c').

	self set: #currency to: (aData at: 'currency').
	self set: #income to: (aData at: 'income').
	self set: #outcome to: (aData at: 'outcome').

	self set: #account to: (aData at: 'account').

	self set: #strings to: (Array new: (aData at: 'quantity') asInteger).
	additionalData at: 'owner' put: self.
	additionalData at: 'bindToStorage' put: false.

	AVBankTransaction import: (aData at: 'strings') from: (additionalData at: 'storage') with: additionalData.
"ПервичныйДокумет = п/п, ДокументПоставки = Сделка"
]
