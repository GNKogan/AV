Class {
	#name : #AVFileTest,
	#superclass : #TestCase,
	#category : #'AV-Tests'
}

{ #category : #tests }
AVFileTest >> testFile [
	"comment stating purpose of message"

	| f |
	f := AVFile new name: '/Users/GNKogan/Documents/Pharo/AV/STspace.text'; open; yourself.
	^ self new
		inProtocol: (TBinaryProtocol new transport: f);
		yourself
]

{ #category : #tests }
AVFileTest >> testNotFound [
	"comment stating purpose of message"

	AVFile new fileName: 'nonExistingFile'
]
