Class {
	#name : #AJurPerson,
	#superclass : #ALegalEntity,
	#instVars : [
		'okpo'
	],
	#category : #'AV-Finance'
}

{ #category : #'as yet unclassified' }
AJurPerson >> initFrom: aData [
	super initFrom: aData.
	self okpo: aData okpo
]

{ #category : #'as yet unclassified' }
AJurPerson >> okpo: aString [ 
	okpo := aString
]
