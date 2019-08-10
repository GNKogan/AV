"
A natural person, human being, an individual

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


    Implementation Points
"
Class {
	#name : #AVPerson,
	#superclass : #AVLegalPerson,
	#instVars : [
		'sex',
		'birthdate',
		'birthplace',
		'photos',
		'snils',
		'jobs',
		'gender'
	],
	#category : #AV
}

{ #category : #'as yet unclassified' }
AVPerson class >> findByUnique: aData [
	"comment stating purpose of message"

	^ self getAll
		detect: [ :each | 
			(each surname = (aData at: 'surname'))
				& (each firstname = (aData at: 'firstname'))
				& (each secondname = (aData at: 'secondname'))
				& (each birthdate = (aData at: 'birthdate')) ]
		ifNone: [ super findByUnique: aData ]
]

{ #category : #'as yet unclassified' }
AVPerson >> age [
	"comment stating purpose of message"

	^ self ageAt: Date now.
]

{ #category : #'as yet unclassified' }
AVPerson >> ageAt: aDate [
	"comment stating purpose of message"
	
	^ aDate-birthdate 

	
]

{ #category : #'as yet unclassified' }
AVPerson >> birthdate [
	^birthdate 
]

{ #category : #'as yet unclassified' }
AVPerson >> initializeAttributes [
	"comment stating purpose of message"

	super initializeAttributes.
	name := AVPersonName new.
	inn := AVInnPerson new.
	
	jobs := OrderedCollection new
]

{ #category : #accessing }
AVPerson >> inn [
	^inn
]
