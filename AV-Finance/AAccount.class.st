Class {
	#name : #AAccount,
	#superclass : #AEntity,
	#instVars : [
		'value',
		'type',
		'type1',
		'id'
	],
	#category : #'AV-Finance'
}

{ #category : #'as yet unclassified' }
AAccount >> id: aString [ 
	id := aString
]

{ #category : #importing }
AAccount >> import: aCollection [ 

	| data |
	data := ADTO newFromJSON: (aCollection).
	self id: data ID.
	self value: data VALUE.
	self type: data TYPE_ID.
	self type1: data VALUE_TYPE.

]

{ #category : #'as yet unclassified' }
AAccount >> type1: aString [ 
	type1 := aString
]

{ #category : #'as yet unclassified' }
AAccount >> type: aString [ 
	type := aString
]

{ #category : #'as yet unclassified' }
AAccount >> value: aString [ 
	value := aString
]
