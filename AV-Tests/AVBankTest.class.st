Class {
	#name : #AVBankTest,
	#superclass : #TestCase,
	#instVars : [
		'storage'
	],
	#category : #'AV-Tests'
}

{ #category : #accessing }
AVBankTest class >> resources [
	"associate the resource with this class of test cases" 
    ^ { AVTestResource }
]

{ #category : #initialization }
AVBankTest >> setUp [
	"comment stating purpose of message"

	storage := AVTestResource current storage
]

{ #category : #tests }
AVBankTest >> testGet [
	"comment stating purpose of message"

	AVEntity allSubInstances.
	AVEntity getAll.

	AVStorage allSubInstances.
	AVStorage getAll.

	AVGood allSubInstances.
	AVGood allInstances.

	AVLegalPerson allSubInstances.
	AVPerson allSubInstances.
	AVJuridicalPerson allSubInstances.
	AVOrganization allSubInstances.
	AVEnterpreneur allSubInstances.
	AVLegalPerson getAll.
	AVPerson getAll.
	AVJuridicalPerson getAll.
	AVOrganization getAll.
	AVEnterpreneur getAll.

	AVBankTransactionClient getAll.
	AVBankTransaction getAll.
	AVBankStatement getAll.
]

{ #category : #tests }
AVBankTest >> testImport [
	"comment stating purpose of message"

	AVGood initialize.
	AVGood importJSON: '/Users/GNKogan/Sites/intra1/goods.json' from: storage.
	
	AVLegalPerson initialize.
	AVCompany initialize.
	AVJuridicalPerson initialize.
	AVEnterpreneur initialize.
	AVOrganization initialize.
	AVBank initialize.
	AVPerson initialize.
	
	AVLegalPerson importJSON: '/Users/GNKogan/Sites/intra1/orgs.json' from: storage.
]

{ #category : #tests }
AVBankTest >> testImportBank [
	"comment stating purpose of message"

	| addData |
	self halt.
	addData := Dictionary new.
	addData at: 'company' put: (storage bindedEntityWith: '00001501' for: 'Контрагенты').

	AVBankStatement initialize.
	AVBankTransaction initialize.
	AVBankTransactionClient initialize.
	AVBankStatement importJSON: '/Users/GNKogan/Sites/intra1/bank.json' from: storage with: addData.
]

{ #category : #tests }
AVBankTest >> testRemove [
	"comment stating purpose of message"

	AVBankTransactionClient removeAll.
	AVBankTransaction removeAll.
	AVBankStatement removeAll.

	AVEnterpreneur removeAll.
	AVOrganization removeAll.
	AVJuridicalPerson removeAll.
	AVPerson removeAll.
	AVLegalPerson removeAll.

	AVGood removeAll.

	AVStorage removeAll.

]

{ #category : #tests }
AVBankTest >> testRemoveBank [
	"comment stating purpose of message"

	AVBankTransactionClient removeAll.
	AVBankTransaction removeAll.
	AVBankStatement removeAll
]
