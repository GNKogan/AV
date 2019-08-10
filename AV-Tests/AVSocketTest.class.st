Class {
	#name : #AVSocketTest,
	#superclass : #TestCase,
	#category : #'AV-Tests'
}

{ #category : #tests }
AVSocketTest >> testSocket [
	"comment stating purpose of message"

	| sock |
	sock := AVSocketServer new login: (AVLogin new host: '127.0.0.1'; port: 2018; yourself); yourself.
	
]
