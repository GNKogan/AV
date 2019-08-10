Class {
	#name : #AVClassifier,
	#superclass : #AVEntity,
	#instVars : [
		'code',
		'full',
		'short'
	],
	#classVars : [
		'Items'
	],
	#category : #AV
}

{ #category : #'as yet unclassified' }
AVClassifier class >> initialize [
	"comment stating purpose of message"

	self initializeMetadata.
]
