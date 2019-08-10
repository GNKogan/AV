Class {
	#name : #AEntity,
	#superclass : #Object,
	#instVars : [
		'name',
		'aliases',
		'storages'
	],
	#category : #'AV-Finance'
}

{ #category : #adding }
AEntity class >> addAttribute: aSymbol type: aType [
	[ (self hasInstVarNamed: aSymbol) not ] assertWithDescription: 'Instance variable ' , aSymbol , ' already exists in class'.	", self class."
	self addInstVarNamed: aSymbol.
	[ (self class hasInstVarNamed: aSymbol) not ] assertWithDescription: 'Variable ' , aSymbol , ' already exists on class side in'.	", self class."
	self class addInstVarNamed: aSymbol.
	self class instVarNamed: aSymbol put: (AVAttribute new name: aSymbol; type: aType)
]

{ #category : #searching }
AEntity class >> find: aBlock [
	"comment stating purpose of message"

	^ self find: aBlock ifNone: [ nil ] 
]

{ #category : #searching }
AEntity class >> find: aBlock ifNone: aBlockCreate [
	"Evaluate aBlock with each of the receiver's elements as the argument.  
	Answer the first element for which aBlock evaluates to true. If none  
	evaluate to true, then evaluate the argument, exceptionBlock."

	^ self getAll detect: aBlock ifNone: aBlockCreate 
]

{ #category : #'as yet unclassified' }
AEntity class >> findAttributes [
	^ nil
]

{ #category : #searching }
AEntity class >> findByName: aString [
	"comment stating purpose of message"

	^ self find: [ :each | each hasName: aString ] ifNone: [ self newNamed: aString ]
]

{ #category : #searching }
AEntity class >> findByUniqueKey: aData [ 
	^ nil
]

{ #category : #searching }
AEntity class >> findByValues: aData [

	^self find: [ :each | each hasValues: aData ].
]

{ #category : #'as yet unclassified' }
AEntity class >> findOrCreate: aData [

	| instance |
	self findSequence detect: [ :func | instance := self perform: func with: aData. instance isNotNil ].
	^ instance
]

{ #category : #searching }
AEntity class >> findSequence [
	^ { #findByUniqueKey:. #findByValues:. #newFrom: }
]

{ #category : #'as yet unclassified' }
AEntity class >> getAll [
	"Return all instances of the class and its subclasses"

	^ self allSubInstances
]

{ #category : #'as yet unclassified' }
AEntity class >> getAllWithAttributes: aCollection [
	"comment stating purpose of message"

	^ Array streamContents: [ :stream | self getAll do: [ :each | stream nextPut: (each getWithAttributes: aCollection) ] ]
]

{ #category : #'as yet unclassified' }
AEntity class >> getFromStorage: aStorage with: anInteger [
	self find: [ :each | each identityForStorage: aStorage = anInteger]
]

{ #category : #importing }
AEntity class >> import: aData [
	"comment stating purpose of message"

	^ (self findOrCreate: aData) register. "bindToDs; update: aData"
	"instance := ((self findByUniqueKey: aData) ifNil: [ self findByValues: aData ]) ifNil: [ self newFrom: aData ]."
]

{ #category : #'as yet unclassified' }
AEntity class >> matchClass: aData [
	^ self
]

{ #category : #'instance creation' }
AEntity class >> newFrom: aData [
	"aData isString ifTrue: [ ^ self new inn: aData ].
	^ self new"
	^ ((self matchClass: aData) ifNil: [ ^ nil ]) new initFrom: aData
]

{ #category : #'instance creation' }
AEntity class >> newNamed: aString [ 
	^ self new name: aString
]

{ #category : #comparing }
AEntity >> = anEntity [
	"Two dictionaries are equal if
	 (a) they are the same 'kind' of thing.
	 (b) they have the same set of keys.
	 (c) for each (common) key, they have the same value.
	See issue 16760 before changing"

	^ super = anEntity
]

{ #category : #accessing }
AEntity >> aliases [
	^ aliases
]

{ #category : #displaying }
AEntity >> displayString [
	"comment stating purpose of message"

	^ (self name) ifNil: [ '<>' ] ifNotNil: [ self name ]
]

{ #category : #'as yet unclassified' }
AEntity >> getWithAttributes: aCollection [
	"comment stating purpose of message"

	^ aCollection collect: [ :each | self each ]
	"Dictionary new
		at: 'name' put: self name;
		at: 'gender' put: self gender;
		yourself"
]

{ #category : #testing }
AEntity >> hasName: aString [ 
	^ (name = aString) or: (aliases anySatisfy: [ :alias | alias = aString ])
]

{ #category : #testing }
AEntity >> hasValues: aData [
	self class findAttributes ifNotNil: [ ^ self hasValues: aData forAttributes: self class findAttributes ].
	aData associationsDo: [ :assoc | ((self perform: assoc key) = assoc value) ifFalse: [^ false] ].
	^ true
]

{ #category : #testing }
AEntity >> hasValues: aData forAttributes: aCollection [

	aCollection do: [ :each | ((self perform: each) = (aData perform: each)) ifFalse: [^ false] ].
	^ true
]

{ #category : #comparing }
AEntity >> hash [
	"Answer an integer hash value for the receiver such that,
	  -- the hash value of an unchanged object is constant over time, and
	  -- two equal objects have equal hash values"

	^ super hash
]

{ #category : #'as yet unclassified' }
AEntity >> identityForStorage: aStorage [
	^ storages at: aStorage ifAbsent: nil.
]

{ #category : #'as yet unclassified' }
AEntity >> initFrom: aData [
	"comment stating purpose of message"

	aData associationsDo: [ :each | self perform: (each key, ':') asSymbol with: each value ]
]

{ #category : #initialization }
AEntity >> initialize [
	"comment stating purpose of message"

	super initialize.
	storages := Dictionary new.
	aliases := OrderedCollection new
]

{ #category : #accessing }
AEntity >> name [
	^ name
]

{ #category : #accessing }
AEntity >> name: aString [ 
	name := aString
]

{ #category : #printing }
AEntity >> printOn: aStream [
	"Append to the argument, aStream, a sequence of characters that  
	identifies the receiver."

	super printOn: aStream.
	aStream
		nextPutAll: ': ''';
		nextPutAll: self displayString;
		nextPutAll: ''''
]

{ #category : #'tools registry' }
AEntity >> register [
	AWorld add: self
]

{ #category : #'as yet unclassified' }
AEntity >> storage: aStorage at: anInteger [
	storages at: aStorage put: anInteger
]
