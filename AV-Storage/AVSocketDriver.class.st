Class {
	#name : #AVSocketDriver,
	#superclass : #AVStorageDriver,
	#instVars : [
		'stream'
	],
	#category : #'AV-Storage'
}

{ #category : #'as yet unclassified' }
AVSocketDriver >> connect: aLogin [
	stream := (SocketStream openConnectionToHostNamed: aLogin host port: aLogin port) timeout: 999999.

]
