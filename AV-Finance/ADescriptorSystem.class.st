Class {
	#name : #ADescriptorSystem,
	#superclass : #DescriptorSystem,
	#category : #'AV-Finance'
}

{ #category : #'as yet unclassified' }
ADescriptorSystem >> XconverterBetweenStringAndField: aField [ 

	^ aField asUTF8Bytes asWideString 
]

{ #category : #accessing }
ADescriptorSystem >> allTableNames [
	"Return a list of all the table names that this system uses."

	^#('agreement')
]

{ #category : #'as yet unclassified' }
ADescriptorSystem >> classModelForAAgreement: aClassModel [

"	aClassModel describedClass: #AAgreement."
	aClassModel newAttributeNamed: #id.
	aClassModel newAttributeNamed: #party1.
	aClassModel newAttributeNamed: #party1Reference.
	aClassModel newAttributeNamed: #party2Reference.
	aClassModel newAttributeNamed: #date.
	aClassModel newAttributeNamed: #payment.
	aClassModel newAttributeNamed: #comment.
	aClassModel newAttributeNamed: #project.
	aClassModel newAttributeNamed: #type1.
]

{ #category : #'as yet unclassified' }
ADescriptorSystem >> descriptorForAAgreement: aDescriptor [
	
	| table |
	table := self tableNamed: 'AGREEMENT'.
	aDescriptor table: table.
	aDescriptor directMappingFor: #id.
	(aDescriptor newMapping: DirectMapping) from: #party1 to: (table fieldNamed: 'party1').
	(aDescriptor newMapping: DirectMapping) from: #party2 to: (table fieldNamed: 'party2').
	(aDescriptor newMapping: DirectMapping) from: #date to: (table fieldNamed: 'date').

]

{ #category : #'as yet unclassified' }
ADescriptorSystem >> tableForAGREEMENT: aTable [

	(aTable createFieldNamed: 'id' type: platform serial) bePrimaryKey.
	aTable createFieldNamed: 'party1' type: (platform varChar: 100).
	aTable createFieldNamed: 'party1Reference' type: (platform varChar: 100).
	aTable createFieldNamed: 'party2' type: (platform varChar: 100).
	aTable createFieldNamed: 'party2Reference' type: (platform varChar: 100).
	aTable createFieldNamed: 'date' type: platform date.
	aTable createFieldNamed: 'comment' type: (platform varChar: 255).

]
