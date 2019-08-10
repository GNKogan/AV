Class {
	#name : #ASalaryNumbersFile,
	#superclass : #ACsvFile,
	#instVars : [
		'month',
		'days',
		'headersAgreement',
		'headers',
		'headersA',
		'headersB',
		'headersF',
		'agreements',
		'headersP',
		'headersC',
		'reports',
		'payments',
		'converters'
	],
	#category : #'AV-Finance'
}

{ #category : #'as yet unclassified' }
ASalaryNumbersFile >> headerSize [
	^ 3
]

{ #category : #initialization }
ASalaryNumbersFile >> initializeImport [
	"comment stating purpose of message"

	agreements := OrderedCollection new.
	reports := OrderedCollection new.
	payments := OrderedCollection new.


]

{ #category : #'as yet unclassified' }
ASalaryNumbersFile >> processData [
	"comment stating purpose of message"
	
	agreements := agreements collect: [ :each | AJobAgreement findByValues: each ].
	reports keysAndValuesDo: [ :index :report | (agreements at: index) addReport: month with: report ].

	"payments
		do: [ :row | 
			agr := (AJobAgreement findByPerson: (row at: #name)) at: 1.
			row at: #name put: nil.
			row
				associationsDo: [ :payment | payment value ifNotNil: [ AFinTransaction newByAgreement: agr date: payment key amount: payment value ] ] 	]"

	"emps do: [ :emp | (except anySatisfy: [ :a | a = (emp at: 1)]) ifFalse: [ AWorld addJobAgreement: (AJobAgreement import: emp) ]]."
]

{ #category : #parsing }
ASalaryNumbersFile >> readHeader [

	| row index |
	converters := Dictionary newFrom: {
		#date -> [ :string | Date readFrom: string pattern: 'd.mm.yy' ].
		#perc1 -> [ :d | (d trimRight: [ :c | c = $% ]) asNumber ].
	}.
	headersAgreement := Dictionary newFrom: { #name -> 'ФИО'. #position -> 'Подразделение'. #department -> 'Команда'. #date -> 'Дата пересмотра'. #agr -> 'Условия'. #fact -> 'Факт'. #payments -> 'Выплачено'. #cash -> 'Из кассы'. #topay -> 'К выплате' }.

	row := dataRaw at: 1.
	month := row at: 2.
	days := row at: 8.

	row := dataRaw at: 2.
	headersA := headersAgreement copyEmpty.
	headersAgreement associationsDo: [ :each | index := row findFirst: [ :cell | cell = each value ]. index = 0 ifFalse: [headersA at: each key put: index] ].	

	headersA addAll: (self readHeaderRow3From: (headersA at: #agr) to: (headersA at: #fact)).
	headersA addAll: (self readHeaderRow3From: (headersA at: #payments) to: (headersA at: #payments)+2).
	headersF := self readHeaderRow3From: (headersA at: #fact) to: (headersA at: #payments).
	headersP := self readHeaderRow3From: (headersA at: #payments) to: (headersA at: #cash).
	
	row := dataRaw at: 3.
	headersC := Dictionary new.
	(headersA at: #cash) to: (headersA at: #topay)-1 do: [ :index1 | headersC at: ((row at: index1) ifNil: [ index1 ] ) put: index1 ].
	headersC at: #name put: 1.

	"to have clean agreement array"
	headersA removeKey: #topay.
	headersA removeKey: #cash.
	headersA removeKey: #agr.
]

{ #category : #parsing }
ASalaryNumbersFile >> readHeaderRow3From: start to: stop [
	"comment stating purpose of message"

	| result |
	headers := Dictionary newFrom: { #salary -> 'Оклад'. #bonus1 -> 'Бонус'. #perc1 -> '% Премии'. #perc2 -> '% Премии2'. #total -> 'Сумма'. #days -> 'Дней'. #hours -> 'Часы переработки'. #daysoff -> 'Отгулы'. #bonus1 -> 'Премия'. #bonus2 -> 'Премия2'. #comment -> 'Комментарий'. #card -> 'Карточка'. #tax -> 'Налоги'. #ndfl -> 'НДФЛ'. #deduction -> 'Удержания' }.
	"#salaryF -> 'Оклад'. #perc1F -> '% Премии'. #bonus1F -> 'Премия'. #perc2F -> '% Премии2'. #bonus2F -> 'Премия2'. #bonusF -> 'Бонус'. #totalF -> 'Сумма'. #card -> 'Карточка'. #tax -> 'Налоги'. #deduction -> 'Удержания'. #comment1 -> 'Комментарий'."

	result := Dictionary new.
	start to: stop-1 do: [ :index | result at: (headers keyAtValue: ((data at: 3) at: index) ifAbsent: [ ^ #nil ]) put: index ].
	result removeKey: #nil ifAbsent: [ ].
	result at: #name put: 1.
	^ result
]

{ #category : #'as yet unclassified' }
ASalaryNumbersFile >> readRow: aRow [
	"comment stating purpose of message"

	agreements add: (self readRow: aRow columns: headersA).
	reports add: (self readRow: aRow columns: headersF).
	payments add: (self readRow: aRow columns: headersC)

]
