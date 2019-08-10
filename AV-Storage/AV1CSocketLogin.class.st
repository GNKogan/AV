Class {
	#name : #AV1CSocketLogin,
	#superclass : #AV1CLogin,
	#instVars : [
		'host',
		'port'
	],
	#category : #'AV-Storage'
}

{ #category : #accessing }
AV1CSocketLogin >> host [
	^ host
]

{ #category : #accessing }
AV1CSocketLogin >> host: aString [
	host := aString
]

{ #category : #accessing }
AV1CSocketLogin >> port [
	^ port
]

{ #category : #'as yet unclassified' }
AV1CSocketLogin >> port: anInteger [
	port := anInteger
]
