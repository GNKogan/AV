Class {
	#name : #AVIdentity,
	#superclass : #AVData,
	#instVars : [
		'id',
		'oid',
		'uuid'
	],
	#category : #AV
}

{ #category : #converting }
AVIdentity >> asNumber [
	"comment stating purpose of message"

	^self id
]

{ #category : #accessing }
AVIdentity >> id [
	^id
]

{ #category : #accessing }
AVIdentity >> id: aValue [
	id := aValue
]

{ #category : #initialization }
AVIdentity >> initialize [
	"comment stating purpose of message"

	super initialize.
	uuid := UUID new.
]

{ #category : #accessing }
AVIdentity >> uuid [
	^uuid
]

{ #category : #accessing }
AVIdentity >> uuid: aValue [
	uuid := aValue
]
