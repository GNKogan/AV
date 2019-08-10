Class {
	#name : #APersonInn,
	#superclass : #AInn,
	#category : #'AV-Finance'
}

{ #category : #initialization }
APersonInn class >> initialize [
	"comment stating purpose of message"

	RegexString := '(\d{12})'.
	super initialize
]

{ #category : #'as yet unclassified' }
APersonInn class >> matchingClass: anEntity [
	^ anEntity isKindOf: APerson
]

{ #category : #'as yet unclassified' }
APersonInn >> checkCS [
	
	self assert: (self digitAt: 11) = (((self calcSC: 2) % 11) % 10).
	self assert: (self digitAt: 12) = (((self calcSC: 1) % 11) % 10).
]

{ #category : #'as yet unclassified' }
APersonInn >> initFromMatcher [
	self code: (Matcher subexpression: 2)
]
