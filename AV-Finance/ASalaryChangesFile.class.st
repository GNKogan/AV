Class {
	#name : #ASalaryChangesFile,
	#superclass : #ASalaryNumbersFile,
	#category : #'AV-Finance'
}

{ #category : #'as yet unclassified' }
ASalaryChangesFile >> headerSize [
	^ 1
]

{ #category : #'as yet unclassified' }
ASalaryChangesFile >> processData [

	| values agr |
	agr := AJobAgreement findByValues: values.
	agr addToHistory: agr date.
	agr update: values.
]

{ #category : #parsing }
ASalaryChangesFile >> readHeader [

	| row index |
	headersAgreement := Dictionary newFrom: { #name -> 'ФИО'. #position -> 'Подразделение'. #department -> 'Руководитель/Команда'. #date -> 'Дата пересмотра'. #payment -> 'Финансовые условия'. #other -> 'Другие условия'. #previous -> 'Было' }.
	headers := Dictionary newFrom: { #salary -> 'Оклад'. #bonus1 -> 'Бонус'. #perc1 -> '% Премии'. #perc2 -> '% Премии2'. #total -> 'Сумма'. #status -> 'Рабочий день'. #jur -> '1C'. #daysoff -> 'Рекомендован'. #comment -> 'Другое'. }.

	row := data at: 1.
	headersA := headersAgreement copyEmpty.
	headersAgreement associationsDo: [ :each | index := row findFirst: [ :cell | cell = each value ]. index = 0 ifFalse: [headersA at: each key put: index] ].	

	headersA addAll: (self readHeaderRow3From: (headersA at: #agr) to: (headersA at: #fact)).
	headersA addAll: (self readHeaderRow3From: (headersA at: #payments) to: (headersA at: #payments)+2).
	headersF := self readHeaderRow3From: (headersA at: #fact) to: (headersA at: #payments).
	headersP := self readHeaderRow3From: (headersA at: #payments) to: (headersA at: #cash).

	"to have clean agreement array"
	headersA removeKey: #topay.
	headersA removeKey: #cash.
	headersA removeKey: #agr.
]
