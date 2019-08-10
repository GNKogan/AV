"
An AVPersonTest is a test class for testing the behavior of AVPerson
"
Class {
	#name : #AVPersonTest,
	#superclass : #TestCase,
	#instVars : [
		'grownup',
		'child'
	],
	#category : #'AV-Tests'
}

{ #category : #'as yet unclassified' }
AVPersonTest >> setUp [
	"comment stating purpose of message"
	
	grownup := AVPerson new set: { #surname -> 'Фамилия'. #firstname -> 'Имя'. #secondname -> 'Отчество'}.
	child := AVPerson get: { #surname -> 'Фамилия1'. #firstname -> 'Имя1'}
]

{ #category : #'tests-accessing' }
AVPersonTest >> testFullName [

	self assert: grownup fullName equals: 'Фамилия Имя Отчество'.
	"self assert: child fullName equals: 'Фамилия1 Имя1'."
]

{ #category : #'tests-as yet unclassified' }
AVPersonTest >> testFullNameWithInitials [
]

{ #category : #'tests-as yet unclassified' }
AVPersonTest >> testInitials [

	self assert: grownup initials equals: 'И. О.'.
]
