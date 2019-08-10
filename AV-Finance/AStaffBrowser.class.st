Class {
	#name : #AStaffBrowser,
	#superclass : #ABrowser,
	#category : #'AV-Finance'
}

{ #category : #building }
AStaffBrowser >> buildBrowser [
	"comment stating purpose of message"

	browser := GLMTabulator new.
	browser row: #stafftable.
	browser transmit
		to: #stafftable;
		andShow: [ :a | 
			a table
				"title: 'Ведомость';"
				column: 'ФИО' evaluated: [ :each | each person displayString ] width: 120;
				column: 'Команда' evaluated: [ :each | each department displayString ] width: 100;
				column: 'Должность (default alfabetic ascending sort)' evaluated: [ :each | each position ] width: 100;
				column: 'Оклад' evaluated: [ :each | each payment salary ] width: 70;
				column: 'Ставка' evaluated: [ :each | each payment rate ] width: 70;
				column: 'Премия' evaluated: [ :each | each payment bonus1 asString , '%' ] width: 50;
				column: 'Зарплата (numeric descending sort)' evaluated: [ :each | each payment total ] width: 70 tags: nil sortedBy: [ :x :y | x > y ] ].
	browser transmit
		from: #stafftable;
		toOutsidePort: #selectedJob.
	^ browser
]

{ #category : #querying }
AStaffBrowser >> organizer [
	"comment stating purpose of message"

	^ AWorld employs
]
