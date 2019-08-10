Class {
	#name : #AEmployeeHistoryBrowser,
	#superclass : #ABrowser,
	#category : #'AV-Finance'
}

{ #category : #building }
AEmployeeHistoryBrowser >> buildBrowser [
	"comment stating purpose of message"

	browser := GLMTabulator new.
	browser row: #row.
	browser transmit
		to: #row;
		andShow: [ :a | 
			a table
				column: 'Дата' evaluated: [ :each | each person displayString ] width: 40;
				column: 'Атрибут' evaluated: [ :each | each department displayString ] width: 60;
				column: 'Было' evaluated: [ :each | each position ] width: 70;
				column: 'Стало' evaluated: [ :each | each payment salary ] width: 70;
				column: '%' evaluated: [ :each | each payment bonus1 asString , '%' ] width: 20].
	^ browser
]
