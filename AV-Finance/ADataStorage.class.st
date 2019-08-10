Class {
	#name : #ADataStorage,
	#superclass : #Object,
	#instVars : [
		'dataRaw',
		'dataParsed'
	],
	#category : #'AV-Finance'
}

{ #category : #initialization }
ADataStorage >> initializeImport [
	^ self
]

{ #category : #'as yet unclassified' }
ADataStorage >> parseData [
	self shouldBeImplemented.
]

{ #category : #'as yet unclassified' }
ADataStorage >> processData [
	self shouldBeImplemented.
]
