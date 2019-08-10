Class {
	#name : #AVStorageDriver,
	#superclass : #Object,
	#instVars : [
		'connection'
	],
	#category : #'AV-Storage'
}

{ #category : #'as yet unclassified' }
AVStorageDriver >> connect: aLogin [
	^self subclassResponsibility.
]
