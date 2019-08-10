Class {
	#name : #AIdentifierCode,
	#superclass : #Object,
	#instVars : [
		'code',
		'date',
		'entity'
	],
	#classVars : [
		'RegexString'
	],
	#classInstVars : [
		'Matcher'
	],
	#category : #'AV-Finance'
}

{ #category : #initialization }
AIdentifierCode class >> initialize [
	Matcher := RegexString asRegex
]

{ #category : #comparing }
AIdentifierCode class >> match: aString [
"aString matchesRegex: RegexString"
	^ Matcher search: aString.

]

{ #category : #comparing }
AIdentifierCode >> = aString [
	^ code = aString
]

{ #category : #checking }
AIdentifierCode >> check [
	^ true
]

{ #category : #'as yet unclassified' }
AIdentifierCode >> checkCS [
	^ true
]

{ #category : #'as yet unclassified' }
AIdentifierCode >> code [
	^ code
]

{ #category : #'as yet unclassified' }
AIdentifierCode >> code: aString [ 
	code := aString
]

{ #category : #accessing }
AIdentifierCode >> digitAt: anInteger [
	"return symbol at anInteger position in the code as a digit (not as a symbol code)"

	^ (code at: anInteger) asInteger - $0 asInteger
]

{ #category : #displaying }
AIdentifierCode >> displayString [
	"comment stating purpose of message"

	^ self code
]

{ #category : #'as yet unclassified' }
AIdentifierCode >> entity: anEntity [
	entity := anEntity
]

{ #category : #comparing }
AIdentifierCode >> hash [
	^ code hash
]

{ #category : #printing }
AIdentifierCode >> printOn: aStream [
	"Append to the argument, aStream, a sequence of characters that  
	identifies the receiver."

	super printOn: aStream.
	aStream
		nextPutAll: ': ''';
		nextPutAll: self displayString;
		nextPutAll: ''''
]
