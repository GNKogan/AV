Class {
	#name : #AEnterpreneur,
	#superclass : #AJurPerson,
	#instVars : [
		'person'
	],
	#category : #'AV-Finance'
}

{ #category : #'as yet unclassified' }
AEnterpreneur class >> matchingClass: aData [
	^ aData type = 'ЧастноеЛицо' and: [ aData name matchesRegexIgnoringCase: '\s*(индивидуальный предприниматель|ИП) .*' ]
]

{ #category : #'as yet unclassified' }
AEnterpreneur >> initFrom: aData [
	super initFrom: aData.
	"self person: aData okpo"
]
