Class {
	#name : #ABankStatementCsvFile,
	#superclass : #ACsvFile,
	#instVars : [
		'headers',
		'headersA'
	],
	#category : #'AV-Finance'
}

{ #category : #'as yet unclassified' }
ABankStatementCsvFile >> footerSize [
	^ 2
]

{ #category : #'as yet unclassified' }
ABankStatementCsvFile >> importClass [
	^ ABankTransaction
]

{ #category : #initialization }
ABankStatementCsvFile >> initialize [
	super initialize.
	self encoding: #cp1251
]

{ #category : #parsing }
ABankStatementCsvFile >> readFooter [

	| row index |
	headers := Dictionary newFrom: { #account -> 'Номер счета'. #dateBegin -> 'Начальная дата'. #dateEnd -> 'Конечная дата'. #balanceIncoming -> 'Входящий остаток'. #balanceOutgoing -> 'Исходящий остаток'. #turnoversDebit -> 'Обороты по дебету'. #turnoversCredit -> 'Обороты по кредиту' }.

	row := dataRaw at: (dataRaw size - self footerSize + 1).
	headersA := headers copy.
	headers associationsDo: [ :each | index := row findFirst: [ :cell | cell = each value ]. index = 0 ifFalse: [headersA at: each key put: index] ].

	row := dataRaw at: (dataRaw size - self footerSize + 2).
	footer := self readRow: row columns: headersA
]

{ #category : #parsing }
ABankStatementCsvFile >> readHeader [

	| row index |
	headers := Dictionary newFrom: { #recordType -> 'Тип'. #ident -> 'Идентификатор'. #dateReceiving -> 'Дата зачисления'. #dateWithdrawal -> 'Дата списания'. #date -> 'Дата'. #num -> 'Номер'. #operationType -> 'Вид операции'. #amount -> 'Сумма'. #currency -> 'Валюта'. #description -> 'Основание платежа'. #receiver:bank:bic -> 'БИК Банка получателя'. #receiver:account -> 'Счет получателя'. #receiver:name -> 'Наименование получателя'. #receiver:inn -> 'ИНН Получателя'. #receiver:bank:code -> 'Код счета Банка получателя'. #receiver:bank:account -> 'Счет Банка получателя'. #receiver:bank:name -> 'Наименование Банка получателя'. #sender:account -> 'Счет Плательщика'. #sender:name -> 'Наименование Плательщика'. #sender:inn -> 'ИНН Плательщика'. #sender:bank:account -> 'Счет Банка плательщика'. #sender:bank:bic -> 'БИК Банка плательщика'. #sender:bank:name -> 'Наименование Банка плательщика'. #paymentPriority -> 'Очередность платежа'. #paymentType -> 'Вид платежа'. #paymentTerm -> 'Срок платежа'. #sender:kpp -> 'Резервное поле 2'. #receiver:kpp -> 29. #budgetCreatorStatus -> 'Резервное поле 1'. #budgetKbk -> 'Резервное поле 3'. #budgetOkato -> 'Резервное поле 4'. #budgetPaymentBasis -> 'Резервное поле 5'. #budgetPaymentPeriod -> 'Резервное поле 6'. #budgetDocNum -> 'Резервное поле 7'. #budgetDocDate -> 'Резервное поле 8' }.

	row := dataRaw at: 1.
	headersA := headers copy.
	headers associationsDo: [ :each | index := row findFirst: [ :cell | cell = each value ]. index = 0 ifFalse: [headersA at: each key put: index] ].
]

{ #category : #'as yet unclassified' }
ABankStatementCsvFile >> readRow: aRow [
	"comment stating purpose of message"

	dataParsed add: (self readRow: aRow columns: headersA)
]
