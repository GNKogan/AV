Class {
	#name : #AInn,
	#superclass : #AIdentifierCode,
	#classVars : [
		'CSCoeffs'
	],
	#category : #'AV-Finance'
}

{ #category : #'as yet unclassified' }
AInn class >> basicNewFrom: aString [
	"comment stating purpose of message"

	(self match: aString) ifFalse: [ ^ nil ].
	^ self new initFromMatcher
]

{ #category : #initialization }
AInn class >> initialize [
	CSCoeffs := { 3. 7. 2 . 4. 10. 3. 5. 9. 4. 6. 8 }.
	super initialize.
]

{ #category : #'as yet unclassified' }
AInn class >> matchClass: anEntity [
	^ self allSubclasses detect: [ :first | first matchingClass: anEntity ] ifNone: [ nil ]
]

{ #category : #'as yet unclassified' }
AInn class >> matchClassByInn: aString [
	^ self allSubclasses detect: [ :first | first match: aString ] ifNone: [ nil ]
]

{ #category : #'as yet unclassified' }
AInn class >> matchingClass: enEntity [
	self subclassResponsibility
]

{ #category : #'instance creation' }
AInn class >> newFrom: aString [
	"comment stating purpose of message"

	aString trim = '' ifTrue: [ ^ nil ].
	^ ((self matchClassByInn: aString) ifNil: [ ^ nil ]) basicNewFrom: aString
]

{ #category : #'instance creation' }
AInn class >> newFrom: aString for: anEntity [
	"comment stating purpose of message"

	| instance |
	"aString trim = '' ifTrue: [ ^ nil ].
	^ (((self matchClass: anEntity) ifNil: [ ^ nil ]) basicNewFrom: aString)"
	(instance := self newFrom: aString) ifNil: [ ^ nil ].
	^ instance entity: anEntity
]

{ #category : #'as yet unclassified' }
AInn >> calcSC: anInteger [
	"calculate control sum with regards to coefficients' array shif"

	^ (anInteger to: CSCoeffs size) inject: 0 into: [ :sum :each | (self digitAt: each - anInteger + 1) * (CSCoeffs at: each) + sum ]
]

{ #category : #'as yet unclassified' }
AInn >> initFromMatcher [
	self shouldBeImplemented
]
