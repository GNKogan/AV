Class {
	#name : #A1cOrgsFile,
	#superclass : #AFileDataStorage,
	#category : #'AV-Finance'
}

{ #category : #'as yet unclassified' }
A1cOrgsFile >> importClass [
	^ ALegalEntity
]

{ #category : #'as yet unclassified' }
A1cOrgsFile >> openFile [
	fp := AJsonDataSource new
		filename: self filename;
		open
]

{ #category : #private }
A1cOrgsFile >> processBlock: item [
	item at: #name put: item nameFull.
	item at: #inn put: item innkpp.
	item at: #identity put: item code1c.
	^ item isGroup == 0.0
]

{ #category : #'as yet unclassified' }
A1cOrgsFile >> transformContDate: anObject [
	anObject = '991230' ifTrue: [ ^ nil ].
	^ Date readFrom: anObject pattern: 'yymmdd'
]

{ #category : #'as yet unclassified' }
A1cOrgsFile >> transformDocDate: anObject [
	anObject = '991230' ifTrue: [ ^ nil ].
	^ Date readFrom: anObject pattern: 'yymmdd'
]
