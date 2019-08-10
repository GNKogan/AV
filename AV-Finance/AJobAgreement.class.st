Class {
	#name : #AJobAgreement,
	#superclass : #AAgreement,
	#instVars : [
		'position',
		'department',
		'type',
		'category',
		'history'
	],
	#classVars : [
		'categories',
		'types'
	],
	#category : #'AV-Finance'
}

{ #category : #'as yet unclassified' }
AJobAgreement class >> findByPerson: aString [
	"comment stating purpose of message"

	^ AWorld employs select: [ :each | each person displayString = aString ]
]

{ #category : #'as yet unclassified' }
AJobAgreement class >> findByValues: aData [
	"comment stating purpose of message"

	^ AWorld employs detect: [ :each | 
			(each person displayString = (aData at: #name))
				& (each position = (aData at: #position))
				& (each department hasName: (aData at: #department)) ]
		ifNone: [ "self import: aData" ]
	"aData associationsDo: [ :assoc | (self hasValue: assoc) ifFalse: [^ false] ].
	^ true
	^self getAll select: [ :each | each hasValues: valuesArray ]."
]

{ #category : #importing }
AJobAgreement class >> import: emp [
	| deps |
	deps := Dictionary
		newFrom:
			{('П' -> 'Разработка').
			('ГП' -> 'Поддержка').
			('UIC' -> 'Развитие').
			('Л' -> 'Лаборатория').
			('П/' -> 'Продвижение').
			('П/П' -> 'Продвижение').
			('П/Р' -> 'Продвижение').
			('П/С' -> 'Продвижение').
			('А' -> 'Администрация')}.
	^ AJobAgreement new
		person: (APerson newNamed: (emp at: 1));
		position: (emp at: 2);
		payment: (AEmployeePayment d1: ((emp at: 5) ifNil: [ 0 ]) d2: ((emp at: 6) ifNil: [ 0 ]) d3: ((emp at: 7) ifNotNil: [ :d | d trimRight: [ :c | c = $% ] ] ifNil: [ 0 ]) d4: ((emp at: 8) ifNotNil: [ :d | d trimRight: [ :c | c = $% ] ] ifNil: [ 0 ]));
		department: (deps at: (emp at: 3));
		addToHistory: (emp at: 4)
]

{ #category : #initialization }
AJobAgreement class >> initialize [
	types := #('Штатный' 'Штатный из дома (Ижевск)' 'Штатный удалённый' 'Внештатный стажёр' 'Внештатный фрилансер' 'Договор ГПХ' 'ИП' 'Сотрудник удалённой компании').
	categories := #('младший специалист' 'специалист 1' 'специалист 2' 'старший специалист' 'ведущий специалист' 'главный специалист')
]

{ #category : #printing }
AJobAgreement class >> printAll [
	"comment stating purpose of message"
	|browser|
	browser := GLMTabulator new.
	browser row: #row.

	browser transmit to: #row; andShow: [ :a |
		a table
			title: 'Ведомость';
			column: 'ФИО' 
				evaluated: [ :each | each person displayString ] ;
			column: 'Команда' 
				evaluated: [ :each | each department displayString ] ;
			column: 'Должность (default alfabetic ascending sort)' 
				evaluated: [ :each | each position ] ;
			column: 'Оклад' 
				evaluated: [ :each | each payment salary ] ;
			column: 'Премия' 
				evaluated: [ :each | each payment bonus1 asString, '%' ] ;
			column: 'Зарплата (numeric descending sort)' 
				evaluated: [ :each | each payment total ] 
				sortedBy: [ :x :y | x > y ]
		].

	browser openOn: AWorld employs.
]

{ #category : #printing }
AJobAgreement class >> printAll: aDepartment [ 
	|browser|
	browser := GLMTabulator new.
	browser row: #departments; row: #row; row: #employee; title: 'Сотрудники'.

	browser transmit to: #departments; andShow: [ :a |
		a tree "display: [ :each | each departments ];"
		children: [ :root :each | root departments ];
	format: #name
		 ].
	browser transmit from: #departments; to: #row; andShow: [ :a |
		a table
			display: [ :dep | dep allEmployees ];
			title: 'Ведомость';
			column: 'ФИО' 
				evaluated: [ :each | each person displayString ] ;
			column: 'Команда' 
				evaluated: [ :each | each department displayString ] ;
			column: 'Должность (default alfabetic ascending sort)' 
				evaluated: [ :each | each position ] ;
			column: 'Оклад' 
				evaluated: [ :each | each payment salary ] ;
			column: 'Премия' 
				evaluated: [ :each | each payment bonus1 asString, '%' ] ;
			column: 'Зарплата (numeric descending sort)' 
				evaluated: [ :each | each payment total ] 
				sortedBy: [ :x :y | x > y ]
		].
	browser transmit from: #row; to: #employee; andShow: [ :a | a text display: [ :person | person person name ] ].

	browser openOn: aDepartment.
]

{ #category : #'as yet unclassified' }
AJobAgreement >> addToHistory: aDate [ 
	history at: aDate put: self clone
]

{ #category : #'as yet unclassified' }
AJobAgreement >> checkReport: aData [
	"comment stating purpose of message"

	^ true.
	"self assert: (payment salary = (aData at: #salary) asNumber) description: 'Wrong salary in report'.
	self assert: (payment bonus >= (aData at: #perc1) asNumber) description: 'Bonus per cent too big'."
]

{ #category : #accessing }
AJobAgreement >> department [
	^ department
]

{ #category : #accessing }
AJobAgreement >> department: aString [ 
	department isNotNil ifTrue: [ department employees remove: self ].
	department := ADepartment findByName: aString.
	department employees add: self
]

{ #category : #accessing }
AJobAgreement >> history [
	"comment stating purpose of message"

	| newCollection |
	newCollection := OrderedCollection new.
	history associationsDo: [:each | each value person: each key.
		newCollection add: each value ].
	^newCollection
]

{ #category : #initialization }
AJobAgreement >> initialize [
	"comment stating purpose of message"

	super initialize.
	history := Dictionary new.
	party1 := #picom
]

{ #category : #accessing }
AJobAgreement >> name [
	"comment stating purpose of message"

	^ self person displayString
]

{ #category : #accessing }
AJobAgreement >> person [
	^ party2
]

{ #category : #accessing }
AJobAgreement >> person: aString [ 
	party2 := aString
]

{ #category : #accessing }
AJobAgreement >> position [
	^ position
]

{ #category : #accessing }
AJobAgreement >> position: aString [ 
	position := aString
]

{ #category : #'as yet unclassified' }
AJobAgreement >> reportClass [
	^ ASalaryBonusReport
]
