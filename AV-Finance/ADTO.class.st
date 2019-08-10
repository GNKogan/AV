Class {
	#name : #ADTO,
	#superclass : #Object,
	#instVars : [
		'data'
	],
	#category : #'AV-Finance'
}

{ #category : #'instance creation' }
ADTO class >> newFrom: aCollection [
	^ self new data: aCollection; split
]

{ #category : #'instance creation' }
ADTO class >> newFromJSON: aCollection [
	^ self new data: aCollection
]

{ #category : #adding }
ADTO >> addLevel: aKey for: anArray [
	| key |
	key := aKey asSymbol.
	anArray
		at: key
		ifPresent: [ :v | 
			(v isMemberOf: self class)
				ifFalse: [ anArray at: key put: (self class newFrom: {(key -> v)}) ] ]
		ifAbsent: [ anArray at: key put: self class new ].
	^ anArray at: key
]

{ #category : #enumerating }
ADTO >> associationsDo: aBlockClosure [ 
	^ data associationsDo: aBlockClosure
]

{ #category : #accessing }
ADTO >> at: key [
	^ data at: key
]

{ #category : #'as yet unclassified' }
ADTO >> at: aString ifPresent: aBlockClosure ifAbsent: aBlockClosure3 [ 
	data at: aString ifPresent: aBlockClosure ifAbsent: aBlockClosure3
]

{ #category : #accessing }
ADTO >> at: key put: value [
	^ data at: key put: value
]

{ #category : #accessing }
ADTO >> data: aCollection [ 
	data := aCollection
]

{ #category : #'reflective operations' }
ADTO >> doesNotUnderstand: aMessage [
	| key |
	key := aMessage selector.
	[ key isUnary ifTrue: [ ^ data at: key ] ]
	on: Exception 
	do: [ :ex | ^ '' "super doesNotUnderstand: aMessage" ].

	^ super doesNotUnderstand: aMessage
]

{ #category : #testing }
ADTO >> includesKey: key [ 
	^ data includesKey: key
]

{ #category : #initialization }
ADTO >> initialize [
	data := Dictionary new
]

{ #category : #accessing }
ADTO >> name [
	[^ data at: #name]
	on: Exception 
	do: [ :ex | super doesNotUnderstand: #name ].
]

{ #category : #'as yet unclassified' }
ADTO >> split [
	| keys arr |
	data
		associationsDo: [ :item | 
			item key isSymbol
				ifTrue: [ keys := $: split: item key.
					keys size > 1
						ifTrue: [ arr := data.
							keys allButLastDo: [ :key | arr := self addLevel: key for: arr ].
							arr at: keys last asSymbol put: item value.
							data removeKey: item key ] ] ]
]
