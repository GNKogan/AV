Class {
	#name : #AJsonDataSource,
	#superclass : #AFileDataSource,
	#category : #'AV-Finance'
}

{ #category : #'as yet unclassified' }
AJsonDataSource >> open [

	fp := NeoJSONReader on: (FileStream readOnlyFileNamed: self filename)
]

{ #category : #accessing }
AJsonDataSource >> read [
	"comment stating purpose of message"

	^ self fp next
]
