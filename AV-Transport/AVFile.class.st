Class {
	#name : #AVFile,
	#superclass : #AVTransport,
	#instVars : [
		'name'
	],
	#category : #'AV-Transport'
}

{ #category : #'as yet unclassified' }
AVFile >> name: aString [ 
	name := aString
]

{ #category : #'as yet unclassified' }
AVFile >> read: aString [ 
	| f |
	f := FileStream readOnlyFileNamed: aString.
	^ NeoCSVReader on: f
]
