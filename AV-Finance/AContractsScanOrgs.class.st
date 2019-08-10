Class {
	#name : #AContractsScanOrgs,
	#superclass : #AContractsScanFileDo,
	#category : #'AV-Finance'
}

{ #category : #'as yet unclassified' }
AContractsScanOrgs >> importClass [
	^ ALegalEntity
]

{ #category : #private }
AContractsScanOrgs >> processBlock: item [
	item at: #company put: (ACompany getFromStorage: self filename with: item client).
	^ super processBlock: item
]
