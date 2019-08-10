Class {
	#name : #AVGood,
	#superclass : #AVEntity,
	#instVars : [
		'name',
		'nameFull',
		'parent'
	],
	#category : #AV
}

{ #category : #'as yet unclassified' }
AVGood class >> class1s [
	"comment stating purpose of message"

	^ 'Номенклатура'
]

{ #category : #'as yet unclassified' }
AVGood class >> import: aData [
	"comment stating purpose of message"

	aData do: [ :each | 
		| inst |
			"search by data"

			inst
				ifNotNil: [ self error: 'TODO' ]
			 	ifNil: [ 
					inst := self new.
					inst set: #name to: (each at: 'name1c').
					inst set: #nameFull to: (each at: 'nameFull').
"					inst set: #parent to: (self getBindedToStorage: storageId with: (each at: 'parent'))."
			].
		].
]

{ #category : #'as yet unclassified' }
AVGood class >> initializeMetadata [
	"comment stating purpose of message"

	IsHierarchical := true
]

{ #category : #'as yet unclassified' }
AVGood >> set: aData [
	"comment stating purpose of message"

	self set: #name to: (aData at: 'name1c').
	self set: #nameFull to: (aData at: 'nameFull').

]
