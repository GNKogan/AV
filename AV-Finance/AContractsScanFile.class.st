Class {
	#name : #AContractsScanFile,
	#superclass : #AFileDataStorage,
	#category : #'AV-Finance'
}

{ #category : #'undo-undo' }
AContractsScanFile >> do [
	(Dictionary
		newFrom:
			{"#clients -> 'Clients'."
			#orgs -> 'Orgs'.
			"#bankAccounts -> 'Accounts'.
			#contracts -> 'Contracts'"})
		associationsDo: [ :each | 
			('AContractsScan' , each value) asClass new
				filename: self filename;
				dataRaw: (dataRaw at: each key);
				do ]
]

{ #category : #'as yet unclassified' }
AContractsScanFile >> openFile [
	fp := AJsonDataSource new
		filename: self filename;
		open
]
