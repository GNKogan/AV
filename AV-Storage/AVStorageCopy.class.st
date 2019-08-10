"
I represent remote copy of the entity.

I store raw data, downloaded from the storage, in chronological order. I know the time of last synchronization with the storage and ID of the remote object correspondig to the entity.

For the Collaborators Part: State my main collaborators and one line about how I interact with them. 

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	id:		<Object>
	lastSync:		<TimeStamp> Timestamp of the last synchronization
	savedData:	<OrderedDictionary> with timestamps as the keys


    Implementation Points
"
Class {
	#name : #AVStorageCopy,
	#superclass : #Object,
	#instVars : [
		'id',
		'savedData',
		'lastSync',
		'storage'
	],
	#category : #'AV-Storage'
}

{ #category : #'as yet unclassified' }
AVStorageCopy >> checkForUpdates [
	"comment stating purpose of message"

	| remoteTs |
	remoteTs := storage getTimestamp: id.
	remoteTs > self getLatestTimestamp ifTrue: [ savedData at: remoteTs put: '' ]
]

{ #category : #'as yet unclassified' }
AVStorageCopy >> getLatest [
	"comment stating purpose of message"

	^ savedData at: self getLatestTimestamp
]

{ #category : #'as yet unclassified' }
AVStorageCopy >> getLatestTimestamp [
	"comment stating purpose of message"

	^ savedData keyAtIndex: savedData size
]

{ #category : #initialization }
AVStorageCopy >> initialize [
	"comment stating purpose of message"

	savedData := OrderedDictionary new
]

{ #category : #'as yet unclassified' }
AVStorageCopy >> isNewerThan: timestamp [
	"comment stating purpose of message"

	^ lastSync > timestamp
]
