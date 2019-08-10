Class {
	#name : #AVWorld,
	#superclass : #Object,
	#instVars : [
		'entities'
	],
	#classVars : [
		'Instance'
	],
	#category : #AV
}

{ #category : #'as yet unclassified' }
AVWorld class >> addEntity: aClass [ 
	self instance entities at: UUID new put: aClass
]

{ #category : #'as yet unclassified' }
AVWorld class >> instance [
	^ Instance ifNil: [ Instance := self basicNew initialize ]
]

{ #category : #'instance creation' }
AVWorld class >> new [
	self error: 'I''m a singleton!'
]

{ #category : #accessing }
AVWorld class >> reset [
	"comment stating purpose of message"

	Instance := nil
]

{ #category : #'as yet unclassified' }
AVWorld >> entities [
	^ entities
]

{ #category : #initialization }
AVWorld >> initialize [
	"comment stating purpose of message"

	entities := Dictionary new
]
