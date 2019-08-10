Class {
	#name : #AVStore,
	#superclass : #Object,
	#instVars : [
		'service',
		'schema'
	],
	#category : #'AV-Storage'
}

{ #category : #'as yet unclassified' }
AVStore >> readAll: table [ 
	service read: table
]

{ #category : #'as yet unclassified' }
AVStore >> schema [
	^ schema
]

{ #category : #'as yet unclassified' }
AVStore >> schema: aSchema [ 
	schema := aSchema
]

{ #category : #'as yet unclassified' }
AVStore >> service: aService [ 
	service := aService
]
