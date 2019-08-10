Class {
	#name : #AVTransport,
	#superclass : #Object,
	#instVars : [
		'stream'
	],
	#category : #'AV-Transport'
}

{ #category : #accessing }
AVTransport >> close [
	self subclassResponsibility
]

{ #category : #accessing }
AVTransport >> flush [
	self subclassResponsibility
]

{ #category : #accessing }
AVTransport >> isOpen [
	self subclassResponsibility
]

{ #category : #'as yet unclassified' }
AVTransport >> login: aLogin [
	login := aLogin
]

{ #category : #accessing }
AVTransport >> open [
	self subclassResponsibility
]

{ #category : #accessing }
AVTransport >> read: anInteger [
	self subclassResponsibility
]

{ #category : #accessing }
AVTransport >> readAll: anInteger [
	^ String streamContents: [:str |
		[str size < anInteger] whileTrue:
			[str nextPutAll: (self read: anInteger - str size)]]
]

{ #category : #accessing }
AVTransport >> write: aString [
	self subclassResponsibility
]
