Class {
	#name : #AOrganization,
	#superclass : #AJurPerson,
	#instVars : [
		'kpp'
	],
	#category : #'AV-Finance'
}

{ #category : #'as yet unclassified' }
AOrganization class >> matchingClass: aData [
	^ aData type = 'Организация'

]

{ #category : #'as yet unclassified' }
AOrganization >> kpp: aString [ 
	kpp := aString
]
