Class {
	#name : #AVATest,
	#superclass : #AVEntity,
	#instVars : [
		'name'
	],
	#category : #AV
}

{ #category : #'as yet unclassified' }
AVATest class >> syncWith: aStore [
	"comment stating purpose of message"

	aStore readAll: (aStore schema tableFor: self class)
]
