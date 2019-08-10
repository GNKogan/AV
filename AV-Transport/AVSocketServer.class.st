Class {
	#name : #AVSocketServer,
	#superclass : #AVTransportServer,
	#instVars : [
		'connectionSocket',
		'isRunning',
		'isRunningLock'
	],
	#category : #'AV-Transport'
}

{ #category : #'as yet unclassified' }
AVSocketServer class >> defaultBacklogSize [
	"Answer the default backlog value"

	^ 10
]

{ #category : #private }
AVSocketServer >> acceptConnections [
	"initializeServerSocket
	Set up a new server socket and listen on it"

	connectionSocket := Socket newTCP.
	connectionSocket listenOn: self port backlogSize: self backlog interface: self interface.
	connectionSocket isValid
		ifFalse: [ self error: 'Cannot create socket on port ', self port printString ].

]

{ #category : #'as yet unclassified' }
AVSocketServer >> backlog [
	^ self class defaultBacklogSize
]

{ #category : #initialization }
AVSocketServer >> initialize [
	super initialize.
	isRunningLock := Mutex new.
	self isRunning: false
]

{ #category : #'as yet unclassified' }
AVSocketServer >> interactOnConnection [
	| interactionSocket |
	interactionSocket := connectionSocket waitForAcceptFor: 1 ifTimedOut: [ ^ self ].
	[ self interactUsing: interactionSocket ] fork
]

{ #category : #'as yet unclassified' }
AVSocketServer >> interactUsing: interactionSocket [
	| receivedData |
	[ receivedData := interactionSocket receiveDataTimeout: 5.
	receivedData crLog.
	interactionSocket sendData: (self processMessage: receivedData) ]
		ensure: [ interactionSocket closeAndDestroy ]
]

{ #category : #'as yet unclassified' }
AVSocketServer >> interface [
	^ login host ifNil: '127.0.0.1'
]

{ #category : #accessing }
AVSocketServer >> isRunning [
	^ isRunningLock critical: [ isRunning ]
]

{ #category : #accessing }
AVSocketServer >> isRunning: aBoolean [
	isRunningLock critical: [ isRunning := aBoolean ]
]

{ #category : #accessing }
AVSocketServer >> port [
	^ login port
]

{ #category : #'as yet unclassified' }
AVSocketServer >> processMessage: aString [
	"comment stating purpose of message"

	^ 'ECHO: ' , aString
]

{ #category : #'as yet unclassified' }
AVSocketServer >> serve [
	"[ self listenLoop ] repeat"
	[ [ self isRunning ] whileTrue: [ self interactOnConnection ] ]
		ensure: [ connectionSocket closeAndDestroy ]
]

{ #category : #accessing }
AVSocketServer >> start [
	isRunningLock
		critical: [ self isRunning
				ifTrue: [ ^ self ].
			self isRunning: true ].
	self acceptConnections.
	[ self serve ] fork
]

{ #category : #accessing }
AVSocketServer >> stop [
	self isRunning: false
]
