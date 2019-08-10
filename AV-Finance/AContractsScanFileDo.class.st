Class {
	#name : #AContractsScanFileDo,
	#superclass : #AFileDataStorage,
	#category : #'AV-Finance'
}

{ #category : #private }
AContractsScanFileDo >> processBlock: item [
	item attribs associationsDo: [ :each | item at: each key put: each value ].
	item at: #identity put: item id.
	^ true
]
