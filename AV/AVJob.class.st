Class {
	#name : #AVJob,
	#superclass : #AVEntity,
	#instVars : [
		'company',
		'person',
		'position',
		'salary'
	],
	#category : #AV
}

{ #category : #'as yet unclassified' }
AVJob >> company: aCompany [ 
	company := aCompany
]

{ #category : #'as yet unclassified' }
AVJob >> person: aPerson [ 
	person := aPerson
]
