Class {
	#name : #APersonName,
	#superclass : #AName,
	#category : #'AV-Finance'
}

{ #category : #'as yet unclassified' }
APersonName class >> cleanData: aData [
	aData isString ifTrue: [ ^ ADTO newFrom: (self splitName: aData) ].
	^ aData
]

{ #category : #'instance creation' }
APersonName class >> newFrom: aData [

	^ self new initFrom: (self cleanData: aData)
]

{ #category : #'as yet unclassified' }
APersonName class >> splitName: aString [
	| parts |
	parts := Character space split: aString trim.
	^ Dictionary newFrom: { #surname -> parts at: 1. #firstname -> parts at: 2. #secondname -> parts at: 3 }
]
