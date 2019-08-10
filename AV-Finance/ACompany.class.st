Class {
	#name : #ACompany,
	#superclass : #AEntity,
	#instVars : [
		'num',
		'producer',
		'contact',
		'phone',
		'email'
	],
	#category : #'AV-Finance'
}

{ #category : #'as yet unclassified' }
ACompany class >> findAttributes [
	^ { #name. #num }
]

{ #category : #'as yet unclassified' }
ACompany >> contact: aString [ 
	contact := aString
]

{ #category : #'as yet unclassified' }
ACompany >> initFrom: aData [
	"comment stating purpose of message"

	super initFrom: aData.
	self
		name: aData name;
		num: aData num;
		contact: aData contact;
		producer: aData producer.
	self contacts
		at: #phones put: aData phone;
		at: #emails put: aData email
]

{ #category : #'as yet unclassified' }
ACompany >> num [
	^ num
]

{ #category : #'as yet unclassified' }
ACompany >> num: aString [ 
	num := aString
]

{ #category : #'as yet unclassified' }
ACompany >> producer: aString [ 
	producer := aString
]
