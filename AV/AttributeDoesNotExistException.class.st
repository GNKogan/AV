Class {
	#name : #AttributeDoesNotExistException,
	#superclass : #Exception,
	#instVars : [
		'name'
	],
	#category : #AV
}

{ #category : #accessing }
AttributeDoesNotExistException >> name: aSymbol [
	name := aSymbol
]
