Class {
	#name : #AVPersonName,
	#superclass : #AVEntity,
	#instVars : [
		'personal',
		'calling',
		'middle',
		'patronymic',
		'surname',
		'nickname',
		'dative'
	],
	#category : #AV
}

{ #category : #accessing }
AVPersonName >> fullName [
	"comment stating purpose of message"

	^ {surname. personal. patronymic} joinUsing: ' '
]

{ #category : #'as yet unclassified' }
AVPersonName >> fullNameWithInitials [
	"comment stating purpose of message"

	^ surname, ' ', self initials
]

{ #category : #'as yet unclassified' }
AVPersonName >> initials [
	"comment stating purpose of message"

	^ personal at:1
]

{ #category : #accessing }
AVPersonName >> name [
	"comment stating purpose of message"

	^ firstname, surname
]

{ #category : #printing }
AVPersonName >> printOn: aStream [
	"comment stating purpose of message"

	aStream
		nextPutAll: personal;
		nextPutAll: ' ';
		nextPutAll: surname
		
	"preferred model: personal surname; calling surname; personal patronymic surname; calling nickname; calling nickname surname; title surname"
]

{ #category : #'as yet unclassified' }
AVPersonName >> surname [
	^surname
]
