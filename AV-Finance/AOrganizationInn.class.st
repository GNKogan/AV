Class {
	#name : #AOrganizationInn,
	#superclass : #AInn,
	#instVars : [
		'kpp'
	],
	#category : #'AV-Finance'
}

{ #category : #initialization }
AOrganizationInn class >> initialize [
	"comment stating purpose of message"

	RegexString := '(\d{10})((\\|\/)(\d{7}))?'.
	super initialize
]

{ #category : #'as yet unclassified' }
AOrganizationInn class >> matchingClass: anEntity [
	^ anEntity isKindOf: AJurPerson
]

{ #category : #'as yet unclassified' }
AOrganizationInn >> checkCS [
	
	^ self assert: (self digitAt: 10) = (((self calcSC: 3) % 11) % 10)
]

{ #category : #'as yet unclassified' }
AOrganizationInn >> initFromMatcher [
	self
		code: (Matcher subexpression: 2);
		kpp:
			(Matcher subexpressionCount < 5
				ifTrue: [ '' ]
				ifFalse: [ Matcher subexpression: 5 ])
]

{ #category : #'as yet unclassified' }
AOrganizationInn >> kpp: aString [ 
	kpp := aString
]
