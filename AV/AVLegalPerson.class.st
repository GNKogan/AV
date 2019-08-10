"
A legal person, in legal contexts often simply person, less ambiguously legal entity,[1][2] is any human or non-human entity, in other words, any human being, firm, or government agency that is recognized as having legal rights and obligations, such as having the ability to enter into contracts, to sue, and to be sued.

The term ""legal person"" is however ambiguous because it is also used in contradistinction to ""natural person"", i.e. as a synonym of terms used to refer only to non-human legal entities.[6][7]

So there are of two kinds of legal entities, human and non-human: natural persons (also called physical persons) and juridical persons (also called juridic, juristic, artificial, legal, or fictitious persons, Latin: persona ficta), which are other entities (such as corporations) that are treated in law as if they were persons.

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
	#name : #AVLegalPerson,
	#superclass : #AVEntity,
	#instVars : [
		'name',
		'contacts',
		'accounts',
		'documents',
		'address',
		'inn',
		'addresses'
	],
	#classVars : [
		'from1CAsIs',
		'from1CCommon',
		'from1CProceed',
		'from1CRename'
	],
	#category : #AV
}

{ #category : #'as yet unclassified' }
AVLegalPerson class >> class1s [
	"comment stating purpose of message"

	^ 'Контрагенты'
]

{ #category : #initialize }
AVLegalPerson class >> factory: aData [
	"comment stating purpose of message"

	(aData at: 'type') = 'Организация'
		ifTrue: [ ^ AVOrganization new ].
	(aData at: 'type') = 'ЧастноеЛицо'
		ifTrue: [ ^ AVEnterpreneur new ]
]

{ #category : #'as yet unclassified' }
AVLegalPerson class >> findByUnique: aData [
	"comment stating purpose of message"

	^ self getAll
		detect: [ :each | each inn = (aData at: 'inn') ]
		ifNone: [ super findByUnique: aData ]
]

{ #category : #'class initialization' }
AVLegalPerson class >> initializeMetadata [
	"comment stating purpose of message"

	super initializeMetadata.

	from1CAsIs := { #okpo }.
	from1CRename := { #name -> 'nameshort' }.
	from1CProceed := {
		#status -> [ :data | 1 - (data at: 'delmark') asInteger ].
		#inn -> [ :data | ((data at: 'innkpp') forceTo: 10 paddingWith: Character space) first: 10 ].
		"#common -> [ :data | ]"
	}.
	"from1CProceed := Dictionary new.
	from1CProceed at: #status put: [ :data | 1 - (data at: 'delmark') asInteger ].
	from1CProceed at: #inn put: [ :data | (data at: 'innkpp') first: 10 ].
	from1CCommon := {[ :data |  ]}"
]

{ #category : #importing }
AVLegalPerson class >> transformFrom1C: aData [
	| values |
"	values := aData copyEmpty."
	values := Dictionary new.
	(aData at: 'isgroup') = '1'
		ifTrue: [ ^ nil ].

	from1CAsIs do: [ :each | values at: each put: (aData at: each asString) ].
	from1CRename associationsDo: [ :assoc | values at: assoc key put: (aData at: assoc value) ].
	from1CProceed associationsDo: [ :assoc | values at: assoc key put: (assoc value value: aData) ].
"	exclude := {'isgroup' . 'group1c'}.
	aData
		associationsDo: [ :each | 
			(exclude includes: each key)
				ifFalse: [ values add: each copy ] ]."

	^ values
]

{ #category : #initialization }
AVLegalPerson >> initializeAttributes [
	"comment stating purpose of message"

	super initializeAttributes.
	
	name := AVString new.
	contacts := Dictionary new.
	accounts := Dictionary new.
	documents := Dictionary new.
	address := AVAddress new.
	addresses := Dictionary new.
	
	_attribs at: (self class instVarIndexFor: #name) put: #name.
	
]

{ #category : #accessing }
AVLegalPerson >> name [
	"comment stating purpose of message"

	^ name
]

{ #category : #'as yet unclassified' }
AVLegalPerson >> set: aData [
	"comment stating purpose of message"

	| addrArray |
	self set: #status to: 1 - (aData at: 'delmark') asInteger.

	self set: #name to: (aData at: 'name1c').
	addrArray := Dictionary new.
	addrArray at: 'legal' put: (aData at: 'addressLegal').
	addrArray at: 'mailing' put: (aData at: 'addressMailing').
	self set: #addresses to: addrArray.
	self set: #contacts to: (aData at: 'phones').

	self set: #inn to: (aData at: 'innkpp').
	"(self instVarNamed: #inn) set: (aData at: 'innkpp')"

]

{ #category : #'as yet unclassified' }
AVLegalPerson >> set: aData with: additionalData [
	"comment stating purpose of message"

	| addrArray |
	self set: #status to: 1 - (aData at: 'delmark') asInteger.

	self set: #name to: (aData at: 'name1c').
	addrArray := Dictionary new.
	addrArray at: 'legal' put: (aData at: 'addressLegal').
	addrArray at: 'mailing' put: (aData at: 'addressMailing').
	self set: #addresses to: addrArray.
	self set: #contacts to: (aData at: 'phones').

	self set: #inn to: (aData at: 'innkpp').
	"(self instVarNamed: #inn) set: (aData at: 'innkpp')"

]
