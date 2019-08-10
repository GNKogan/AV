"
I am the main abstract class for adapting native scalar types in AV.

Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:

For the Class part:  State a one line summary. For example, ""I represent a paragraph of text"".

For the Responsibility part: Three sentences about my main responsibilities - what I do, what I know.

For the Collaborators Part: State my main collaborators and one line about how I interact with them. 

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	created:		<Object>
	events:		<Object>
	lastChanged:		<Object>
	value:		<Object>


    Implementation Points
"
Class {
	#name : #AVData,
	#superclass : #Object,
	#instVars : [
		'value',
		'created',
		'lastChanged',
		'events'
	],
	#category : #AV
}

{ #category : #'as yet unclassified' }
AVData class >> socktest [
	"comment stating purpose of message"

	| stream result |
	stream := (SocketStream openConnectionToHostNamed: '10.0.0.24' port: 2017).
	[ [ stream sendCommand: 'hello'.
	result := stream upToEnd.	"Give us all data until the socket is closed."
	result crTrace.
	stream sendCommand: 'bye' ]
		ensure: [ stream close ] ]
		on: ConnectionTimedOut
		do: [ :ex | 
			ex asString crTrace.
			ex resume ]
]

{ #category : #'as yet unclassified' }
AVData >> set: aValue [
	"comment stating purpose of message"

	value := aValue
]

{ #category : #'as yet unclassified' }
AVData >> update: aData for: varName [
	"comment stating purpose of message"

	aData at: varName ifPresent: [:v | self set: v ].
]
