Class {
	#name : #AVTestResource,
	#superclass : #TestResource,
	#instVars : [
		'storage'
	],
	#category : #'AV-Tests'
}

{ #category : #'as yet unclassified' }
AVTestResource >> drawDown [
	"comment stating purpose of message"

	storage := nil
]

{ #category : #initialization }
AVTestResource >> initialize [
	"comment stating purpose of message"

	storage := AVStorage new
]

{ #category : #accessing }
AVTestResource >> storage [
	"comment stating purpose of message"

	^ storage 
]
