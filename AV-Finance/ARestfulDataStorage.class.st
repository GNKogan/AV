Class {
	#name : #ARestfulDataStorage,
	#superclass : #ADataStorage,
	#instVars : [
		'url'
	],
	#category : #'AV-Finance'
}

{ #category : #'instance creation' }
ARestfulDataStorage class >> newFor: anUrl [

	^ self new url: anUrl
]

{ #category : #importing }
ARestfulDataStorage >> import [
	self auth.
	self open.
	self read.
	self do
]

{ #category : #accessing }
ARestfulDataStorage >> read [
	dataRaw := NeoJSONReader fromString: (ZnClient new get: self url)
]
