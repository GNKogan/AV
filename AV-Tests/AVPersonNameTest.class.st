Class {
	#name : #AVPersonNameTest,
	#superclass : #TestCase,
	#instVars : [
		'name'
	],
	#category : #'AV-Tests'
}

{ #category : #initialization }
AVPersonNameTest >> setUp [
	"comment stating purpose of message"

	name := AVPersonName new set: { #surname -> 'Фамилия'. #personal -> 'Имя'. #patronymic -> 'Отчество'}
]

{ #category : #tests }
AVPersonNameTest >> testName [
	"comment stating purpose of message"

	self assert: name equals: 'Имя Фамилия'
]
