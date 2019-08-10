Class {
	#name : #AEmployeePaymentsBrowser,
	#superclass : #ABrowser,
	#category : #'AV-Finance'
}

{ #category : #building }
AEmployeePaymentsBrowser >> buildBrowser [
	"comment stating purpose of message"

	browser := GLMTabulator new.
	browser row: #row.
	browser transmit
		to: #row;
		andShow: [ :a | 
			a table
				column: 'Месяц' evaluated: [ :each | each period ] width: 70;
				column: 'Премия' evaluated: [ :each | each bonus1 asString , '%' ] width: 30;
				column: 'Сумма' evaluated: [ :each | each total ] width: 50
				].
	^ browser
]
