Class {
	#name : #AVBankTransaction,
	#superclass : #AVFinTransaction,
	#instVars : [
		'docOrder',
		'bankStatement'
	],
	#category : #'AV-Finance'
}

{ #category : #initialization }
AVBankTransaction class >> factory: aData [
	"comment stating purpose of message"

	(aData at: 'type') = 'Оплата поставщику'
		ifTrue: [ ^ AVBankTransactionSupplier new ].
	(aData at: 'type') = 'Поступления от покупателей'
		ifTrue: [ ^ AVBankTransactionClient new ].
	(aData at: 'type') = 'Выплата зарплаты'
		ifTrue: [ ^ AVBankTransactionSalary new ].
	(aData at: 'type') = 'Отчисления на социальные нужды'
		ifTrue: [ ^ AVBankTransactionTax new ].
	(aData at: 'type') = 'Платежи в бюджет'
		ifTrue: [ ^ AVBankTransactionTax new ].
	(aData at: 'type') = 'Выдача под авансовый отчет'
		ifTrue: [ ^ AVBankTransactionCash new ].
	(aData at: 'type') = 'Получение наличных из банка'
		ifTrue: [ ^ AVBankTransactionCash new ].
	(aData at: 'type') = 'Прочие выплаты'
		ifTrue: [ ^ AVBankTransactionService new ].
	(aData at: 'type') = 'Прочие поступления'
		ifTrue: [ ^ AVBankTransactionService new ]
]

{ #category : #initialization }
AVBankTransaction class >> idAttributeName [
	"comment stating purpose of message"

	^'num1c'
]

{ #category : #initialization }
AVBankTransaction >> set: aData with: additionalData [
	"comment stating purpose of message"

	super set: aData with: additionalData.
	self set: #bankStatement to: (additionalData at: 'owner').
	((additionalData at: 'owner') get: #strings) at: (aData at: 'num1c') put: self.
	self set: #date to: ((additionalData at: 'owner') get: #date).

	self set: #currency to: (aData at: 'currency').
	self set: #comment to: (aData at: 'purpose').
"ПервичныйДокумет = п/п, ДокументПоставки = Сделка"
]
