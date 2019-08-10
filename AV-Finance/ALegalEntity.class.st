Class {
	#name : #ALegalEntity,
	#superclass : #AEntity,
	#instVars : [
		'nameSort',
		'inn',
		'accounts',
		'addresses',
		'contacts',
		'contracts'
	],
	#category : #'AV-Finance'
}

{ #category : #'as yet unclassified' }
ALegalEntity class >> findAttributes [
	^ { #name. #inn. }
]

{ #category : #searching }
ALegalEntity class >> findByInn: aData [
	| inn |
	inn := aData isString
		ifTrue: [ aData trim ]
		ifFalse: [ AInn newFrom: (aData at: #inn) trim ].
	inn = '' ifTrue: [ ^ false ].
	^ self find: [ :each | each inn = inn displayString ] "ifNone: [ self newFrom: aData ]"
]

{ #category : #searching }
ALegalEntity class >> findByUniqueKey: aData [
	^ ((aData includesKey: #inn) and: [ (aData inn trim = '') not ]) ifTrue: [ self findByInn: aData ] ifFalse: [ nil ]
]

{ #category : #'as yet unclassified' }
ALegalEntity class >> matchClass: aData [
	^ self allSubclasses detect: [ :first | first matchingClass: aData ] ifNone: [ nil ]
]

{ #category : #'as yet unclassified' }
ALegalEntity class >> matchingClass: aData [
	^ false
]

{ #category : #accessing }
ALegalEntity >> accounts [
	^ accounts
]

{ #category : #'as yet unclassified' }
ALegalEntity >> addresses [
	^ addresses
]

{ #category : #'as yet unclassified' }
ALegalEntity >> contacts [
	^ contacts
]

{ #category : #'as yet unclassified' }
ALegalEntity >> contracts [
	^ contracts
]

{ #category : #'as yet unclassified' }
ALegalEntity >> initFrom: aData [
	"comment stating purpose of message"

	super initFrom: aData.
	self
		name: aData nameFull;
		nameSort: aData name1c;
		inn: aData innkpp.
	self addresses
		at: #legal put: aData addressLegal;
		at: #post put: aData addressMailing;
		at: #real put: aData SaddressMailing;
		at: #realZip put: aData SaddressZip.
	self contacts at: #phones put: aData phones.
	aData contNum ifNotEmpty: [ self contracts add: aData contNum ]
	"name: aData name;
		inn: aData inn;
		kpp: aData kpp;
		accounts add: aData account"
	"code1c code1cFull delmark parent"
	"docNum docSeries docIssued docDate"
	"Scode1c Scode1cFull Sname1c directorName directorPosition contNum contDate   yandex Sdelmark SisGroup owner"
	"accounts: code1c, code1cFull, name1c, account, bank, delmark, isGroup, owner"
	"services: code1c, code1cFull, name1c, service, period, quantity, cost, beginDate, endDate, contNum, contDate, delmark, isGroup, owner"
	"deals: code1c, code1cFull, name1c, type, delmark, isGroup, owner"
]

{ #category : #initialization }
ALegalEntity >> initialize [
	super initialize.
	addresses := Dictionary new.
	contacts := Dictionary new.
	accounts := OrderedCollection new.
	contracts := OrderedCollection new
]

{ #category : #'as yet unclassified' }
ALegalEntity >> inn [
	^ inn
]

{ #category : #accessing }
ALegalEntity >> inn: aString [
	"inn := aString"

	(aString isKindOf: AInn)
		ifTrue: [ inn := aString ]
		ifFalse: [ inn := AInn newFrom: aString for: self]
]

{ #category : #'as yet unclassified' }
ALegalEntity >> nameSort: aString [ 
	nameSort := aString
]
