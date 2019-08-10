Class {
	#name : #ADTOTest,
	#superclass : #TestCase,
	#category : #'AV-Tests-Finance'
}

{ #category : #tests }
ADTOTest >> testAt [
	"comment stating purpose of message"

	| a |
	a := ADTO new.
	a data: (Dictionary newFrom: { #symbol -> 'SYMBOL'. 'string' -> 'STRING' } ).
	self assert: a symbol equals: 'SYMBOL'.
	self assert: a string equals: 'STRING'.

]
