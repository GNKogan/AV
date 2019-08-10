Class {
	#name : #AVInnOrganization,
	#superclass : #AVInn,
	#instVars : [
		'kpp'
	],
	#category : #AV
}

{ #category : #'as yet unclassified' }
AVInnOrganization class >> initializeMetadata [
	"comment stating purpose of message"

	RegexString := '(\d{10})((\\|\/)(\d{7}))?'.
]

{ #category : #'as yet unclassified' }
AVInnOrganization >> set: aString [
	"comment stating purpose of message"

	| items |
	items := RegexString asRegex.
	items search: aString.
	inn := items subexpression: 2.
	kpp := items subexpression: 5.
]
