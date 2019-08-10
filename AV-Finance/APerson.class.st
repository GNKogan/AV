Class {
	#name : #APerson,
	#superclass : #ALegalEntity,
	#instVars : [
		'firstName',
		'surName',
		'finAccounts',
		'secondName',
		'birthDate',
		'city',
		'gender',
		'sourceType',
		'sourceDetails',
		'comments',
		'dateCreate',
		'dateModify',
		'id'
	],
	#category : #'AV-Finance'
}

{ #category : #'as yet unclassified' }
APerson class >> matchingClass: aData [
	self todo. "TODO improve"
	^ aData type = 'ЧастноеЛицо' and: [ (aData name matchesRegexIgnoringCase: '\s*(индивидуальный предприниматель|ИП) .*') not ]
]

{ #category : #'instance creation' }
APerson class >> newFromB24CRM: anInteger [

	^ self new import: (NeoJSONReader fromString: (ZnClient new get: 'https://b24.picom.ru/rest/15/9t7ixpczqu7d4qo5/crm.contact.get?id=', anInteger asString))
]

{ #category : #'as yet unclassified' }
APerson >> birthDate: aString [ 
	birthDate := aString
]

{ #category : #'as yet unclassified' }
APerson >> city: aString [ 
	city := aString
]

{ #category : #'as yet unclassified' }
APerson >> comments: aString [ 
	comments := aString
]

{ #category : #'as yet unclassified' }
APerson >> dateCreate: aString [ 
	dateCreate := aString
]

{ #category : #'as yet unclassified' }
APerson >> dateModify: aString [ 
	dateModify := aString
]

{ #category : #'as yet unclassified' }
APerson >> firstName: aString [ 
	firstName := aString
]

{ #category : #accessing }
APerson >> gender [
	^ gender
]

{ #category : #'as yet unclassified' }
APerson >> gender: aString [ 
	gender := aString
]

{ #category : #'as yet unclassified' }
APerson >> id: aString [ 
	id := aString
]

{ #category : #importing }
APerson >> import: aCollection [ 

	| data |
	data := ADTO newFromJSON: (aCollection at: 'result').
	self id: data ID.
	self firstName: data NAME.
	self surName: data LAST_NAME.
	self secondName: data SECOND_NAME.
	self birthDate: data BIRTHDATE.
	self city: data UF_CRM_1525073919.
	self gender: data UF_CRM_1523963933.
	self sourceType: data SOURCE_ID.
	self sourceDetails: data UF_CRM_1462432535.
	self comments: data COMMENTS.
	self dateCreate: data DATE_CREATE.
	self dateModify: data DATE_MODIFY.
	data EMAIL ifNotNil: [ :d | d do: [ :acc | self accounts add: (AAccount new import: acc) ]  ].
	data PHONE ifNotNil: [ :d | d do: [ :acc | self accounts add: (AAccount new import: acc) ]  ].
	data WEB ifNotNil: [ :d | d do: [ :acc | self accounts add: (AAccount new import: acc) ]  ].
	data IM ifNotNil: [ :d | d do: [ :acc | self accounts add: (AAccount new import: acc) ]  ].
]

{ #category : #initialization }
APerson >> initialize [
	super initialize.
	accounts := OrderedCollection new
]

{ #category : #'as yet unclassified' }
APerson >> secondName: aString [ 
	secondName := aString
]

{ #category : #accessing }
APerson >> sourceDetails: aString [ 
	sourceDetails := aString
]

{ #category : #'as yet unclassified' }
APerson >> sourceType: aString [ 
	sourceType := aString
]

{ #category : #'as yet unclassified' }
APerson >> surName: aString [ 
	surName := aString
]
