Class {
	#name : #AFileDataSource,
	#superclass : #ADataSource,
	#instVars : [
		'filename',
		'fp'
	],
	#category : #'AV-Finance'
}

{ #category : #'as yet unclassified' }
AFileDataSource >> filename [
	^ filename
]

{ #category : #'as yet unclassified' }
AFileDataSource >> filename: aString [ 
	filename := aString
]

{ #category : #'as yet unclassified' }
AFileDataSource >> fp [
	^ fp
]
