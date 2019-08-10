Class {
	#name : #AAgreement,
	#superclass : #AEntity,
	#instVars : [
		'id',
		'party1',
		'party1Reference',
		'party2',
		'party2Reference',
		'date',
		'payment',
		'reports',
		'comment',
		'project',
		'type1'
	],
	#category : #'AV-Finance'
}

{ #category : #'as yet unclassified' }
AAgreement class >> findByParties: aParty1 and: aParty2 [

	^ self find: [ :each | (each party1 = aParty1 & each party2 = aParty2) | (each party2 = aParty1 & each party1 = aParty2) ] ifNone: [ nil ]
]

{ #category : #'as yet unclassified' }
AAgreement >> addReport: aString [ 

	| report |
	report := self reportClass new.
	report period: aString; agreement: self.
	reports add: report.
	^ report
]

{ #category : #adding }
AAgreement >> addReport: aString with: aData [

	^ (self checkReport: aData; addReport: aString) setUp: aData
]

{ #category : #'as yet unclassified' }
AAgreement >> comment: aString [ 
	comment := aString
]

{ #category : #'as yet unclassified' }
AAgreement >> date: aDate [ 
	date := aDate
]

{ #category : #initialization }
AAgreement >> initialize [
	"comment stating purpose of message"

	reports := OrderedCollection new
]

{ #category : #'as yet unclassified' }
AAgreement >> party1 [
	^ party1
]

{ #category : #'as yet unclassified' }
AAgreement >> party1: aString [ 
	party1 := aString
]

{ #category : #'as yet unclassified' }
AAgreement >> party2 [
	^ party2
]

{ #category : #'as yet unclassified' }
AAgreement >> party2: aString [ 
	party2 := aString
]

{ #category : #'as yet unclassified' }
AAgreement >> payment [
	^ payment
]

{ #category : #'as yet unclassified' }
AAgreement >> payment: aPayment [ 
	payment := aPayment
]

{ #category : #'as yet unclassified' }
AAgreement >> project: aString [ 
	project := aString
]

{ #category : #'as yet unclassified' }
AAgreement >> report: aString [ 
	^ reports detect: [ :each | each period = aString ] ifNone: (self addReport: aString)
]

{ #category : #'as yet unclassified' }
AAgreement >> reportClass [
	self shouldBeImplemented.
]

{ #category : #'as yet unclassified' }
AAgreement >> reports [
	^ reports
]

{ #category : #'as yet unclassified' }
AAgreement >> type: aString [ 
	type1 := aString
]
