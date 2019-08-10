"
A juridical person is a non-human legal entity, in other words any organization that is not a single natural person but is authorized by law with duties and rights and is recognized as a legal person and as having a distinct identity. This includes any incorporated organizations including corporations, government agencies, and NGOs. Also known as artificial person, juridical entity, juristic person, or legal person.


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
	#name : #AVJuridicalPerson,
	#superclass : #AVCompany,
	#instVars : [
		'ogrn',
		'okpo',
		'okved',
		'head',
		'accountant',
		'signer',
		'branchType',
		'branchCount',
		'registrationDate',
		'liquidationDate',
		'actualityDate'
	],
	#category : #AV
}

{ #category : #searching }
AVJuridicalPerson class >> findByInn: anInn [
	"comment stating purpose of message"

"	| values |
	values := Dictionary newFrom: { #inn -> anInn }.
	^ self find: values."
	
	^self getAll detect: [ :each | each inn = anInn ] ifNone: nil
	

]

{ #category : #'as yet unclassified' }
AVJuridicalPerson class >> parseOrgName: aName [
	"comment stating purpose of message"

	| okopf |
	okopf := AVOkopf new.
	
	AVOkopf at: aName.
]

{ #category : #accessing }
AVJuridicalPerson >> inn [
	^inn
]

{ #category : #accessing }
AVJuridicalPerson >> inn: anInn [
	inn := anInn
]

{ #category : #'as yet unclassified' }
AVJuridicalPerson >> set: aData [
	"comment stating purpose of message"

	super set: aData.
	self set: #okpo to: (aData at: 'okpo').
]

{ #category : #'as yet unclassified' }
AVJuridicalPerson >> set: aData with: additionalData [
	"comment stating purpose of message"

	super set: aData.
	self set: #okpo to: (aData at: 'okpo').
]
