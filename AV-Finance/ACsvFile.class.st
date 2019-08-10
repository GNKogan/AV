Class {
	#name : #ACsvFile,
	#superclass : #AFileDataStorage,
	#instVars : [
		'encoding',
		'footer'
	],
	#category : #'AV-Finance'
}

{ #category : #'as yet unclassified' }
ACsvFile >> encoding [
	^ encoding
]

{ #category : #'as yet unclassified' }
ACsvFile >> encoding: aString [ 
	encoding := aString
]

{ #category : #'as yet unclassified' }
ACsvFile >> footerSize [
	^ 0
]

{ #category : #'as yet unclassified' }
ACsvFile >> headerSize [
	^ 1
]

{ #category : #'as yet unclassified' }
ACsvFile >> openFile [
	fp := ACSVDataSource new
		filename: self filename;
		encoding: self encoding;
		open
]

{ #category : #importing }
ACsvFile >> parseData [
	"comment stating purpose of message"

	self readHeader.
	self readData.
	self readFooter

]

{ #category : #importing }
ACsvFile >> readData [
	"comment stating purpose of message"

	dataRaw
		from: 1 + self headerSize
		to: dataRaw size - self footerSize
		do: [ :row | self readRow: row ]

]

{ #category : #'as yet unclassified' }
ACsvFile >> readRow: aRow columns: anArray [

	^ anArray collect: [ :val | aRow at: val asInteger ]
]
