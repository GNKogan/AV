Class {
	#name : #AVLogin,
	#superclass : #Object,
	#instVars : [
		'storage',
		'username',
		'password',
		'secure'
	],
	#category : #'AV-Storage'
}

{ #category : #comparing }
AVLogin >> = aLogin [ 
	^self class == aLogin class and: 
			[self name = aLogin name and: 
					[self storage class = aLogin storage class and: 
							[self username = aLogin username "and: 
									[self connectString = aLogin connectString]"]]]
]

{ #category : #accessing }
AVLogin >> discardPassword [

	password := nil
]

{ #category : #comparing }
AVLogin >> hash [
	^self name hash + self storage class hash + self username hash "+ self connectString hash"
]

{ #category : #initialization }
AVLogin >> initialize [
	"My schema supplies the schema to my accessor, to its session and to that session's descriptor system.  Since a DatabaseTable's schema is initialized to the empty string, not nil (and that of a StoreLogin must never be nil), initialize to the empty string here, so that calling code need not check for nil."

	"schema := ''."
	secure := false
]

{ #category : #accessing }
AVLogin >> password [
	"Return the password for this login. If we are in a secure mode, then erase the password as soon as it is accessed."
	| returnValue |
	returnValue := password.
	secure ifTrue: [ self discardPassword ].
	^returnValue.
]

{ #category : #accessing }
AVLogin >> password: aString [ 
	password := aString
]

{ #category : #accessing }
AVLogin >> secure [
	^secure
]

{ #category : #accessing }
AVLogin >> secure: aBoolean [
	secure := aBoolean
]

{ #category : #accessing }
AVLogin >> storage [
	^storage
]

{ #category : #accessing }
AVLogin >> storage: aStorage [
	storage := aStorage
]

{ #category : #accessing }
AVLogin >> username [
	^username
]

{ #category : #accessing }
AVLogin >> username: aString [
	username := aString
]
