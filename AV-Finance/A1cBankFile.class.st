Class {
	#name : #A1cBankFile,
	#superclass : #AFileDataStorage,
	#category : #'AV-Finance'
}

{ #category : #'as yet unclassified' }
A1cBankFile >> importClass [
	^ ABankStatement
]

{ #category : #'as yet unclassified' }
A1cBankFile >> openFile [
	fp := AJsonDataSource new
		filename: self filename;
		open
]

{ #category : #private }
A1cBankFile >> processBlock: item [
	item at: #date put: (Date readFrom: item date1c pattern: 'yymmdd').
	^ true
]
