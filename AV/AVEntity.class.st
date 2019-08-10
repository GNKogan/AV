"
I am the main abstract class for AV-entities.

status:
0 - default, means incomplete entity or internal error
1 - active/existed
2 - deleted
3 - inactive (for journals, непроведённый)

I have most common attributes (ID, status, etc). I contain attributes according to metadata and know how to read metas. I know about converstions/transitions, storages, views. I could be used in AV-collections (Catalogs, Journals, etc).

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
	#name : #AVEntity,
	#superclass : #Object,
	#instVars : [
		'status',
		'storages',
		'copies'
	],
	#classVars : [
		'AVAttributes',
		'AVAttributesIndex',
		'IsHierarchical'
	],
	#category : #AV
}

{ #category : #'instance creation' }
AVEntity class >> addAttribute: aSymbol [
	"comment stating purpose of message"

	AVAttributes at: aSymbol ifPresent: [ self error: 'Attribute ' , aSymbol , ' already exists' ].
	[self hasInstVarNamed: aSymbol] assertWithDescription: 'Instance variable ' , aSymbol , ' already exists'.

	self addInstVarNamed: aSymbol.
	AVAttributes at: aSymbol put: (AVAttribute new name: aSymbol).
	AVAttributesIndex at: aSymbol put: (self instVarIndexFor: aSymbol).
	^ AVAttributes at: aSymbol
]

{ #category : #'instance creation' }
AVEntity class >> attributeIndex: aSymbol [
	^ AVAttributesIndex at: aSymbol ifAbsent: [ AttributeDoesNotExistException new name: aSymbol ]
]

{ #category : #'as yet unclassified' }
AVEntity class >> attributes [
	^ AVAttributes
]

{ #category : #'as yet unclassified' }
AVEntity class >> attributesDo: aBlock [
	AVAttributes do: aBlock
]

{ #category : #'as yet unclassified' }
AVEntity class >> class1s [
	"comment stating purpose of message"

	self shouldBeImplemented 
]

{ #category : #'instance creation' }
AVEntity class >> delAttribute: aSymbol [
	"comment stating purpose of message"

	AVAttributesIndex at: aSymbol put: nil.
	AVAttributes at: aSymbol put: nil.
	self removeInstVarNamed: aSymbol
]

{ #category : #initialization }
AVEntity class >> factory: aData [
	"comment stating purpose of message"

	^ self new.
]

{ #category : #'as yet unclassified' }
AVEntity class >> find [
	"comment stating purpose of message"

	^ self.
]

{ #category : #'as yet unclassified' }
AVEntity class >> find: valuesArray [
	"comment stating purpose of message"

	^self getAll select: [ :each | each hasValues: valuesArray ].
]

{ #category : #'as yet unclassified' }
AVEntity class >> findByUnique: aData [ 
	^ nil
]

{ #category : #importing }
AVEntity class >> from1C [
	"comment stating purpose of message"

	AVSession
		forLogin:
			(AV1CSocketLogin new
				host: '10.0.0.24';
				port: '2017';
				path: '';
				username: 'intra1';
				password: '')
]

{ #category : #importing }
AVEntity class >> fromJSON: aFilename [
	"comment stating purpose of message"

	AVEvent register: ('Import from JSON: ', self class asString).
	self import: (STON fromStream: (FileStream readOnlyFileNamed: aFilename)).

]

{ #category : #'as yet unclassified' }
AVEntity class >> get: valuesArray [
	"comment stating purpose of message"

	| inst |
	inst := self find: valuesArray.
	inst ifNil: [ inst := self new set: valuesArray ].
	^ inst 
]

{ #category : #'as yet unclassified' }
AVEntity class >> getAll [
	"comment stating purpose of message"

	^ self allSubInstances "AllInstances" 
]

{ #category : #'as yet unclassified' }
AVEntity class >> getBindedToStorage: aStorage with: anId [
	"comment stating purpose of message"

	"^(Storages at: aStorage id id) at: anId ifAbsent: nil"
	^ self getAll detect: [ :each | (each bindedToStorage: (aStorage id id)) = anId] ifNone: nil
]

{ #category : #'as yet unclassified' }
AVEntity class >> getById1: aId [
	"comment stating purpose of message"

	^ self getAll detect: [ :each | (each id id) = aId ]
]

{ #category : #'as yet unclassified' }
AVEntity class >> getById: anId [
	"comment stating purpose of message"

	^Instances at: anId
]

{ #category : #'as yet unclassified' }
AVEntity class >> getByUuid: anUuid [
	"comment stating purpose of message"

	^AllInstances at: anUuid
]

{ #category : #'as yet unclassified' }
AVEntity class >> idAttributeName [
	"comment stating purpose of message"

	^'code1c'
]

{ #category : #importing }
AVEntity class >> import: aData [
	"comment stating purpose of message"

| storageId |
storageId := 1.

	aData do: [ :each | 
		| inst valuesArray |
		valuesArray := self transformFrom1C: each.
		valuesArray ifNotNil: [
			"seach for entity binded to this storage"
			inst := self getBindedToStorage: storageId with: (each at: 'code1c').
			
			"not found - search by data"
			inst ifNil: [ inst := self findByUnique: valuesArray ]. "self findByInn: (valuesArray at: #inn)."
"TODO: set storageId binding if found"

			inst
				ifNotNil: [ inst update: valuesArray ]
			 	ifNil: [ inst := (self factory: each) set: valuesArray ]. "[ inst := self new set: valuesArray ]."
			inst bindToStorage: storageId withId: (each at: 'code1c').
			].
		].
]

{ #category : #importing }
AVEntity class >> import: aData from: aStorage [
	"comment stating purpose of message"

	self import: aData from: aStorage with: Dictionary new
]

{ #category : #importing }
AVEntity class >> import: aData from: aStorage with: additionalData [
	"comment stating purpose of message"

	aData
		select: [ :each | "IsHierarchical or:" (each at: 'isGroup' ifAbsent: 0.0) = 0.0 ]
		thenDo: [ :each | 
			| inst |
			"seach for entity binded to this storage"
			inst := (additionalData at: 'bindToStorage' ifAbsent: true)
				ifTrue: [ "self getBindedToStorage: aStorage with:" aStorage bindedEntityWith: (each at: self idAttributeName) for: self class1s ]
				ifFalse: [ nil ].

			"not found - search by data"
			"inst ifNil: [ inst := self findByUnique: valuesArray ]. "
			"self findByInn: (valuesArray at: #inn)."
			inst
				ifNotNil: [ self error: 'TODO' ]
				ifNil: [ inst := self factory: each.
					additionalData at: 'storage' put: aStorage.
					inst set: each with: additionalData.
					IsHierarchical
						ifTrue: [ inst set: #parent to: (aStorage bindedEntityWith: (each at: 'parent') for: self class1s "self getBindedToStorage: aStorage with: (each at: 'parent')") ] ].
			(additionalData at: 'bindToStorage' ifAbsent: true)
				ifTrue: [ inst bindToStorage: aStorage withId: (each at: self idAttributeName) ] ]
]

{ #category : #importing }
AVEntity class >> importJSON: aFilename from: aStorage [
	"comment stating purpose of message"

	self importJSON: aFilename from: aStorage with: Dictionary new
]

{ #category : #importing }
AVEntity class >> importJSON: aFilename from: aStorage with: additionalData [
	"comment stating purpose of message"

	| aData |
	aData := STON fromStream: (FileStream readOnlyFileNamed: aFilename).
	self import: aData from: aStorage with: additionalData
]

{ #category : #'class initialization' }
AVEntity class >> initialize [
	"comment stating purpose of message"

	"Items := IdentityDictionary new.
	Instances := IdentityDictionary new.
	AllInstances := IdentityDictionary new.
	NextId := 1.
	Storages := IdentityDictionary new."
	AVAttributes := Dictionary new.
	AVAttributesIndex := Dictionary new.
	self initializeMetadata
]

{ #category : #initialization }
AVEntity class >> initializeMetadata [
	"comment stating purpose of message"

	IsHierarchical := false
]

{ #category : #'as yet unclassified' }
AVEntity class >> registerStorage: aStorage [
	"comment stating purpose of message"

	Storages at: aStorage id id put: Dictionary new
]

{ #category : #removing }
AVEntity class >> removeAll [
	"comment stating purpose of message"

	self getAll do: [ :each | each remove ].
	3 timesRepeat: [ Smalltalk garbageCollect ].

]

{ #category : #'as yet unclassified' }
AVEntity class >> sync [
	"comment stating purpose of message"

	Storages do: [ :each | self syncWith: each ]
]

{ #category : #'as yet unclassified' }
AVEntity class >> syncWith: aStorage [
	"comment stating purpose of message"

	
]

{ #category : #accessing }
AVEntity >> at: name [
	self instVarAt: (self class attributeIndex: name)
]

{ #category : #accessing }
AVEntity >> at: name put: value [
	self instVarAt: (self class attributeIndex: name) put: value
]

{ #category : #comparing }
AVEntity >> attrib: anAttrib hasValue: aValue [
	"comment stating purpose of message"

	^ (self get: anAttrib == aValue)
]

{ #category : #'as yet unclassified' }
AVEntity >> bindToStorage: aStorage withId: anId [
	"comment stating purpose of message"

"TODO: check if storage has registered"
	"_storageIds at: (aStorage id id) put: anId.
	(Storages at: aStorage id id) at: anId put: self"
	storages add: { aStorage. anId }.
	aStorage bindEntity: self with: anId for: self class class1s
]

{ #category : #'as yet unclassified' }
AVEntity >> bindedToStorage: aStorageId [
	"comment stating purpose of message"

	^ _storageIds at: aStorageId
]

{ #category : #'as yet unclassified' }
AVEntity >> doForEachVar: aBlock [
	"comment stating purpose of message"

"	| fields values |
	fields := (1 to: self class instSize) collect: [:i | self instVarAt: i].
	values withIndexDo: [:v :i | self instVarAt: i put: v]."
	1 to: self class instSize do: [ :i | aBlock value: (self instVarAt: i) ].
]

{ #category : #'reflective operations' }
AVEntity >> doesNotUnderstand: aMessage [
	| key |
	key := aMessage selector.
	[ key isUnary ifTrue: [ ^ self at: key ].
	^ (key isKeyword and: [ (key occurrencesOf: $:) = 1 ])
		ifTrue: [ key := key allButLast asSymbol.
			self at: key put: aMessage arguments first ]
		ifFalse: [ super doesNotUnderstand: aMessage ] ]
		on: AttributeDoesNotExistException
		do: [ :ex | super doesNotUnderstand: aMessage ]

	"aMessage arguments isEmpty
		ifTrue: [ ^ (self disabledExtensions includes: aMessage selector) not ].
	aMessage arguments size = 1
		ifTrue: [ 
			^ aMessage arguments first
				ifTrue: [ self disabledExtensions 
						remove: aMessage selector allButLast 
						ifAbsent: [ ""ignore all settings that are re-enabled but 
										that were not disabled before
										(it can happen when the property was renamed)"" ] ]
				ifFalse: [ self disabledExtensions add: aMessage selector allButLast ] ].
	^ super doesNotUnderstand: aMessage" 
]

{ #category : #accessing }
AVEntity >> getItems [
	"comment stating purpose of message"

	^ Items
]

{ #category : #comparing }
AVEntity >> hasValue: anAssoc [
	"comment stating purpose of message"

	^ self hasValueD: anAssoc
]

{ #category : #comparing }
AVEntity >> hasValueA: anAssoc [
	"comment stating purpose of message"

	(self instVarsInclude: anAssoc key) ifFalse: [ ^ false ].
	^ ((self instVarNamed: anAssoc key) value = anAssoc value)
]

{ #category : #comparing }
AVEntity >> hasValueD: anAssoc [
	"comment stating purpose of message"

	^ _data includesAssociation: anAssoc
]

{ #category : #comparing }
AVEntity >> hasValues: valuesArray [
	"comment stating purpose of message"

	valuesArray associationsDo: [ :assoc | (self hasValue: assoc) ifFalse: [^ false] ].
	^ true
]

{ #category : #accessing }
AVEntity >> id [
	"comment stating purpose of message"

	^ id
]

{ #category : #initialization }
AVEntity >> initialize [
	"comment stating purpose of message"

	super initialize.
	"id := AVIdentity new.
	id id: NextId.
	NextId := NextId + 1."
	self initializeAttributes.
	"Items at: id put: self.
	Instances at: id id put: self.
	A llInstances at: id uuid put: self."	"super>> AllInstances at: uuid put: self"
	AVWorld addEntity: self.

	"history API"
	"_actualityTime := Time primUTCMicrosecondsClock.
	_changes := OrderedDictionary new at: _actualityTime put: self."

	"storage API"
	"_storageIds := Dictionary new."
	storages := Set new.
	copies := Dictionary new.

]

{ #category : #initialization }
AVEntity >> initializeAttributes [
	"comment stating purpose of message"

	self class attributesDo: [ :att  | self at: att name put: att produce ]
]

{ #category : #'as yet unclassified' }
AVEntity >> printOn: aStream [
	"comment stating purpose of message"

	"_data printElementsOn: aStream ."
	_data storeOn: aStream .
	^ self 
]

{ #category : #'as yet unclassified' }
AVEntity >> remove [
	"comment stating purpose of message"

	"_storageIds associationsDo: [ :assoc | (Storages at: assoc key) removeKey: assoc value ]."
	storages do: [ :each | (each at: 1) unbindEntityWith: (each at: 2) for: self class class1s ].
	storages removeAll.

	"AllInstances removeKey: id uuid.
	Instances removeKey: id id.
	Items removeKey: id."

]

{ #category : #accessing }
AVEntity >> set: valuesArray [
	"comment stating purpose of message"

	"valuesArray keysDo: [ :key | data at: key put: (aValues at: key) ].
	valuesArray keysDo: [ :key | self instVarAt: key put: (aValues at: key) ]."
	valuesArray associationsDo: [ :assoc | self set: assoc key to: assoc value ].
	^ self
]

{ #category : #accessing }
AVEntity >> set: anAttrib to: aValue [
	"comment stating purpose of message"

	self instVarNamed: anAttrib put: aValue .
]

{ #category : #accessing }
AVEntity >> set: aData with: additionalData [
]

{ #category : #'file primitives' }
AVEntity >> sync: aStorage [
	"comment stating purpose of message"

	| remoteCopy |
	remoteCopy := copies at: aStorage.
	remoteCopy isNewer ifTrue: [ self updateFrom: aStorage ]
	ifFalse: [ self updateIn: aStorage ].
	remoteCopy lastSync.
	remoteCopy hasChanged

	"remoteCopy := aStorage at: anId.
	
	val := aStorage at: anId.
	val getVer > storedVer ifTrue: [ get ].
	hash != val hash
	"
]

{ #category : #'as yet unclassified' }
AVEntity >> update: aData [
	"comment stating purpose of message"

	"_changes last: self copy.
	_actualityTime := Time primUTCMicrosecondsClock.
	_changes at: _actualityTime put: self."

	"((1 to: self class instSize) select: [ :i | ((self instVarNameForIndex: i) at: 1) ~ #_ ])
		do: [ :i | (self instVarAt: i) update: aData ]."
	"self set: aData"
	_attribs associationsDo: [ :assoc | (self instVarAt: assoc key) update: aData for: assoc value ]
]

{ #category : #'as yet unclassified' }
AVEntity >> update: aData for: varName [
	"comment stating purpose of message"

	aData at: varName ifPresent: [:v | self instVarNamed: varName put: v ].
]
