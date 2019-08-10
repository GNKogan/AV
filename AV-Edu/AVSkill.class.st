Class {
	#name : #AVSkill,
	#superclass : #Object,
	#instVars : [
		'name',
		'children',
		'levels',
		'books'
	],
	#category : #'AV-Edu'
}

{ #category : #'instance creation' }
AVSkill class >> for: aString [
	^ self new name: aString.
]

{ #category : #adding }
AVSkill >> addBooks: aString [
	books := aString.
]

{ #category : #adding }
AVSkill >> addChild: aString [
	children add: (AVSkill for: aString).
	^ children last.
]

{ #category : #accessing }
AVSkill >> children [
	"comment stating purpose of message"

	^ children
]

{ #category : #initialization }
AVSkill >> initialize [
	children := OrderedCollection new.
]

{ #category : #accessing }
AVSkill >> name [
	^ name , (children size > 0 ifTrue: [' (', children size asString ,')'] ifFalse: '').
]

{ #category : #accessing }
AVSkill >> name: aString [
	name := aString
]
