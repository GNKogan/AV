Class {
	#name : #AIncomeOutcomeReport,
	#superclass : #AReport,
	#category : #'AV-Finance'
}

{ #category : #printing }
AIncomeOutcomeReport >> build [
	"comment stating purpose of message"

	ABankTransaction
		do: [ :each | 
			data
				add:
					(Dictionary
						newFrom: [ #conragent -> each party2 name.
							#inn -> each party2 inn.
							#kpp -> each party2 kpp.
							#docnum -> each document num.
							#docdate -> each document date.
							#contract -> each agreement num.
							#description -> each agreement description.
							#date -> each date.
							#amount -> each amount ]) ]
]

{ #category : #initialization }
AIncomeOutcomeReport >> initialize [
	
	super initialize.
	data := OrderedCollection new.
]

{ #category : #printing }
AIncomeOutcomeReport >> print [
	"comment stating purpose of message"

	data do: [ :each |  ]
]
