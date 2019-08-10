Class {
	#name : #AVAttribute,
	#superclass : #Object,
	#instVars : [
		'name',
		'type',
		'size',
		'title',
		'comment',
		'default',
		'notnull',
		'setter',
		'getter',
		'initter',
		'notsetVal',
		'nullVal'
	],
	#category : #AV
}

{ #category : #accessing }
AVAttribute >> name [
	^ name
]

{ #category : #accessing }
AVAttribute >> name: aSymbol [
	name := aSymbol
]

{ #category : #operations }
AVAttribute >> produce [
	"comment stating purpose of message"

	^ (Smalltalk at: type) new
]

{ #category : #accessing }
AVAttribute >> type [
	^ type
]

{ #category : #accessing }
AVAttribute >> type: aClass [
	type := aClass
]
