Class {
	#name : #AVTest,
	#superclass : #TestCase,
	#instVars : [
		'var1',
		'var2',
		'vars',
		'var3'
	],
	#category : #'AV-Tests'
}

{ #category : #initialization }
AVTest >> at: aVar put: aValue [
	"comment stating purpose of message"

	self instVarAt: (vars at: aVar) put: aValue

]

{ #category : #'as yet unclassified' }
AVTest >> initialize [
	"comment stating purpose of message"

	vars := { #var1 -> var1 . #var2 -> var2 }
]

{ #category : #tests }
AVTest >> testStore [
	"comment stating purpose of message"

	| store schema |
	schema := AV1cv77Schema instance.
	schema addTable: 'test.csv' for: AVATest class.
	store := AVStore new service: AVFile new; schema: schema.
	AVATest syncWith: store
]

{ #category : #initialization }
AVTest >> var1 [
	var1 printString

]

{ #category : #'as yet unclassified' }
AVTest >> var1: aValue [
	"comment stating purpose of message"

	var1 := aValue
]

{ #category : #accessing }
AVTest >> var2: aValue [
	"comment stating purpose of message"

	var2 := aValue
]

{ #category : #accessing }
AVTest >> var3: aValue [
	"comment stating purpose of message"

	var3 := aValue
]

{ #category : #accessing }
AVTest >> vars [
	vars show.
]
