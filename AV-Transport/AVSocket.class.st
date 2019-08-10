Class {
	#name : #AVSocket,
	#superclass : #AVTransport,
	#instVars : [
		'login'
	],
	#category : #'AV-Transport'
}

{ #category : #'as yet unclassified' }
AVSocket >> close [
	self isOpen ifTrue: [stream close]
]

{ #category : #'as yet unclassified' }
AVSocket >> connect [
	^ (self socketStreamClass openConnectionToHost:
		(NetNameResolver addressForName: login host) port: login port)
			timeout: 180;
			binary;
			yourself
]

{ #category : #'as yet unclassified' }
AVSocket >> isOpen [
	^ stream isNil not
		and: [stream socket isConnected]
		and: [stream socket isOtherEndClosed not]
]

{ #category : #'as yet unclassified' }
AVSocket >> open [
	stream := self connect
]

{ #category : #testing }
AVSocket >> read: size [
	| data |
	[data := stream next: size.
	data isEmpty ifTrue: [TTransportError signal: 'Could not read ', size asString, ' bytes'].
	^ data]
		on: ConnectionClosed
		do: [TTransportClosedError signal]
]

{ #category : #'as yet unclassified' }
AVSocket >> socketStreamClass [
	^ SocketStream
]

{ #category : #testing }
AVSocket >> write: aCollection [
	[stream nextPutAll: aCollection]
		on: ConnectionClosed
		do: [TTransportClosedError signal]
]
