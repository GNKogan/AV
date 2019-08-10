Class {
	#name : #AFileDataStorage,
	#superclass : #ADataStorage,
	#instVars : [
		'filename',
		'fp'
	],
	#category : #'AV-Finance'
}

{ #category : #'instance creation' }
AFileDataStorage class >> newFor: aString [
	^ self new filename: aString
]

{ #category : #'as yet unclassified' }
AFileDataStorage >> dataRaw: aCollection [ 
	dataRaw := aCollection
]

{ #category : #'undo-undo' }
AFileDataStorage >> do [
	self parseData.
	self processData
]

{ #category : #accessing }
AFileDataStorage >> filename [
	^ filename
]

{ #category : #accessing }
AFileDataStorage >> filename: aString [ 
	filename := aString
]

{ #category : #importing }
AFileDataStorage >> import [
	"comment stating purpose of message"

	self openFile.
	self readFile.
	self initializeImport.
	self do

]

{ #category : #'as yet unclassified' }
AFileDataStorage >> importClass [
	self shouldBeImplemented
]

{ #category : #initialization }
AFileDataStorage >> initialize [
	dataParsed := OrderedCollection new
]

{ #category : #'as yet unclassified' }
AFileDataStorage >> openFile [
	self shouldBeImplemented
]

{ #category : #parsing }
AFileDataStorage >> parseData [
	dataRaw do: [ :row | dataParsed add: (ADTO newFrom: (self processRow: (self readRow: row))) ]
]

{ #category : #'as yet unclassified' }
AFileDataStorage >> parsedData [
	^ dataParsed
]

{ #category : #private }
AFileDataStorage >> processBlock: item [
	^ true
]

{ #category : #'as yet unclassified' }
AFileDataStorage >> processData [
	dataParsed
		do: [ :item | 
			(self processBlock: item)
				ifTrue: [ (self importClass import: item) storage: self filename at: item identity ] ]
]

{ #category : #'as yet unclassified' }
AFileDataStorage >> processRow: aRow [
	"comment stating purpose of message"

	^ self transform: (self removeEmpty: aRow)
]

{ #category : #'as yet unclassified' }
AFileDataStorage >> readFile [
	dataRaw := fp read
]

{ #category : #'as yet unclassified' }
AFileDataStorage >> readRow: aRow [
	"comment stating purpose of message"

	 ^ aRow
]

{ #category : #'as yet unclassified' }
AFileDataStorage >> removeEmpty: aRow [
	^ aRow select: [ :item | item value notEmpty ]
]

{ #category : #accessing }
AFileDataStorage >> transform: aRow [
	^ aRow
		associationsCollect: [ :item | 
			(self respondsTo: ('transform' , item key capitalized , ':') asSymbol)
				ifTrue: [ self perform: ('transform' , item key capitalized , ':') asSymbol with: item value ]
				ifFalse: [ item value isString
						ifTrue: [ item value trim ] ] ]
]
