Class {
	#name : #ACSVDataSource,
	#superclass : #AFileDataSource,
	#instVars : [
		'encoding'
	],
	#category : #'AV-Finance'
}

{ #category : #'as yet unclassified' }
ACSVDataSource >> convert [
	"comment stating purpose of message"

	^ self encoding
		ifNotNil: [ self filename asFileReference readStreamDo: [ :in | (ZnCharacterReadStream on: in binary encoding: self encoding) upToEnd ] ]
		ifNil: [ self filename asFileReference ].
]

{ #category : #'as yet unclassified' }
ACSVDataSource >> encoding [
	^ encoding
]

{ #category : #'as yet unclassified' }
ACSVDataSource >> encoding: aString [ 
	encoding := aString
]

{ #category : #'as yet unclassified' }
ACSVDataSource >> open [

	fp := NeoCSVReader on: (self convert readStream).
	"FileStream readOnlyFileNamed: self filename)."
	fp separator: $;.
]

{ #category : #accessing }
ACSVDataSource >> read [
	"comment stating purpose of message"

	^ self fp upToEnd.
]
