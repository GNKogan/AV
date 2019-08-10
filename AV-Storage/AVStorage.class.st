"
Source 		Schema 					Provider 							Account 				Table 		Transport 			Protocol
1cv77 			Enterprise, Kamin 		Service+Schema ?Host/base 	Host, base, user 	ref/jou 	Socket, ActiveX 	JSON
File 			file sctructure 											Comp, Dir, user 	file 		FS, Socket 			CSV?
MySQL 			DB schema 													Host, user, db 		table 		Driver 
NIC API 		API 															Contract 				? 			HTTP REST 			JSON 
Yandex 		API 
hosting
xls
dadata
whois

Auth?


Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:

For the Class part:  State a one line summary. For example, ""I represent a paragraph of text"".

For the Responsibility part: Three sentences about my main responsibilities - what I do, what I know.

For the Collaborators Part: State my main collaborators and one line about how I interact with them. 

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	charset:		<Object>
	config:		<Object>
	db:		<Object>
	host:		<Object>
	id:		<Object>
	pass:		<Object>
	stor:		<Object>
	type:		<Object>
	user:		<Object>


    Implementation Points
"
Class {
	#name : #AVStorage,
	#superclass : #AVEntity,
	#instVars : [
		'stor',
		'type',
		'config',
		'host',
		'user',
		'pass',
		'db',
		'charset',
		'entities'
	],
	#category : #'AV-Storage'
}

{ #category : #'as yet unclassified' }
AVStorage >> bindEntity: anEntity with: anId for: aClass [
	"comment stating purpose of message"

	(entities at: aClass ifAbsentPut: Dictionary new) at: anId put: anEntity
]

{ #category : #'as yet unclassified' }
AVStorage >> bindedEntityWith: anId for: aClass [
	"comment stating purpose of message"

	^ (entities at: aClass ifAbsentPut: Dictionary new) at: anId ifAbsent: [  nil ]
]

{ #category : #initialization }
AVStorage >> initializeAttributes [
	"comment stating purpose of message"

	entities := Dictionary new.
]

{ #category : #'as yet unclassified' }
AVStorage >> login: aBlock [ 
	| currentLogin |
	self log: 'Login'.
	self databaseDriver: self connectionClass new.
	self
		execute: [
			self databaseDriver connect: currentLogin.
			currentLogin secure 
				ifTrue: [ currentLogin discardPassword ]
			]
		ifError: aBlock.
	self log: 'Login finished'
]

{ #category : #'as yet unclassified' }
AVStorage >> unbindEntity: anEntity for: aClass [
	"comment stating purpose of message"

	(entities at: aClass) remove: anEntity.
]

{ #category : #'as yet unclassified' }
AVStorage >> unbindEntity: anEntity with: anId for: aClass [
	"comment stating purpose of message"

	(entities at: aClass) remove: anEntity.
]

{ #category : #'as yet unclassified' }
AVStorage >> unbindEntityWith: anId for: aClass [
	"comment stating purpose of message"

	(entities at: aClass) removeKey: anId
]
