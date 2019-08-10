Class {
	#name : #AVOrganization,
	#superclass : #AVJuridicalPerson,
	#instVars : [
		'legalName',
		'okopf'
	],
	#category : #AV
}

{ #category : #'as yet unclassified' }
AVOrganization >> initializeAttributes [
	"comment stating purpose of message"

	super initializeAttributes.
	inn := AVInnOrganization new.

]

{ #category : #'as yet unclassified' }
AVOrganization >> set: aData [
	"comment stating purpose of message"

	super set: aData.
	self set: #legalName to: (aData at: 'nameFull').
]

{ #category : #'as yet unclassified' }
AVOrganization >> set: aData  with: additionalData [
	"comment stating purpose of message"

	super set: aData.
	self set: #legalName to: (aData at: 'nameFull').
]
