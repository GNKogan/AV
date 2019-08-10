"
I contain the description of data scheme for particular storage.

Scheme is just a description. All the descriptor objects for tables, fields and mappings are lazy created just for the moment of usage.


For the Collaborators Part: State my main collaborators and one line about how I interact with them. 

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	tables:		<Object>


    Implementation Points
"
Class {
	#name : #AVSchema,
	#superclass : #Object,
	#instVars : [
		'tables'
	],
	#classVars : [
		'Instance'
	],
	#category : #'AV-Storage'
}

{ #category : #'as yet unclassified' }
AVSchema class >> instance [
	^ Instance ifNil: [ Instance := self basicNew initialize ]
]

{ #category : #'as yet unclassified' }
AVSchema >> addTable: aString for: aClass [ 
	tables at: aClass put: aString
]

{ #category : #initialization }
AVSchema >> initialize [
	"comment stating purpose of message"

	tables := Dictionary new
]

{ #category : #'as yet unclassified' }
AVSchema >> tableFor: aClass [ 
	^ tables at: aClass
]
