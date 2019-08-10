Class {
	#name : #AVInnPerson,
	#superclass : #AVInn,
	#category : #AV
}

{ #category : #'as yet unclassified' }
AVInnPerson class >> initializeMetadata [
	"comment stating purpose of message"

	RegexString := '(\d{12})?'.
]

{ #category : #'as yet unclassified' }
AVInnPerson >> set: aString [
	"comment stating purpose of message"

	| items |
	items := RegexString asRegex.
	items search: aString.
	inn := items subexpression: 2.
]
