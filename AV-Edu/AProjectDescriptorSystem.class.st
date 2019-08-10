Class {
	#name : #AProjectDescriptorSystem,
	#superclass : #DescriptorSystem,
	#category : #'AV-Edu'
}

{ #category : #'as yet unclassified' }
AProjectDescriptorSystem >> XconverterBetweenStringAndField: aField [ 

	^ aField asUTF8Bytes asWideString 
]

{ #category : #accessing }
AProjectDescriptorSystem >> allTableNames [
	"Return a list of all the table names that this system uses."

	^#('project')
]

{ #category : #'as yet unclassified' }
AProjectDescriptorSystem >> classModelForAProject: aClassModel [

"	aClassModel describedClass: #AAgreement."
	(aClassModel newAttributeNamed: #id) useDirectAccess: true.
	aClassModel newAttributeNamed: #parent type: AProject.
	aClassModel newAttributeNamed: #name.
	aClassModel newAttributeNamed: #description.
	aClassModel newAttributeNamed: #business.
	aClassModel newAttributeNamed: #owner.
	aClassModel newAttributeNamed: #pm.
	aClassModel newAttributeNamed: #children collectionOf: AProject.
	aClassModel newAttributeNamed: #status.
	aClassModel newAttributeNamed: #audience.
	aClassModel newAttributeNamed: #geography.
	aClassModel newAttributeNamed: #effect.
	aClassModel newAttributeNamed: #goal.
	aClassModel newAttributeNamed: #tasks.
	aClassModel newAttributeNamed: #kpi.
	aClassModel newAttributeNamed: #partners.
	aClassModel newAttributeNamed: #plan.
	aClassModel newAttributeNamed: #budget.
]

{ #category : #'as yet unclassified' }
AProjectDescriptorSystem >> descriptorForAProject: aDescriptor [
	| table |
	table := self tableNamed: 'PROJECT'.
	aDescriptor table: table.
	aDescriptor directMappingFor: #id.
	(aDescriptor newMapping: DirectMapping) from: #name to: (table fieldNamed: 'name').
	(aDescriptor newMapping: DirectMapping) from: #description to: (table fieldNamed: 'description').
	(aDescriptor newMapping: DirectMapping) from: #business to: (table fieldNamed: 'business').
	(aDescriptor newMapping: DirectMapping) from: #owner to: (table fieldNamed: 'owner').
	(aDescriptor newMapping: DirectMapping) from: #pm to: (table fieldNamed: 'pm').
	(aDescriptor newMapping: OneToManyMapping)
		attributeName: #children;
		beExclusive;
		mappingCriteria: (Join from: (table fieldNamed: 'id') to: (table fieldNamed: 'parent_id')).
	(aDescriptor newMapping: OneToOneMapping)
		attributeName: #parent;
		referenceClass: AProject;
		mappingCriteria: (Join from: (table fieldNamed: 'parent_id') to: ((self tableNamed: 'PROJECT') fieldNamed: 'id')).
	(aDescriptor newMapping: DirectMapping) from: #status to: (table fieldNamed: 'status').
	(aDescriptor newMapping: DirectMapping) from: #audience to: (table fieldNamed: 'audience').
	(aDescriptor newMapping: DirectMapping) from: #geography to: (table fieldNamed: 'geography').
	(aDescriptor newMapping: DirectMapping) from: #effect to: (table fieldNamed: 'effect').
	(aDescriptor newMapping: DirectMapping) from: #goal to: (table fieldNamed: 'goal').
	(aDescriptor newMapping: DirectMapping) from: #tasks to: (table fieldNamed: 'tasks').
	(aDescriptor newMapping: DirectMapping) from: #kpi to: (table fieldNamed: 'kpi').
	(aDescriptor newMapping: DirectMapping) from: #partners to: (table fieldNamed: 'partners').
	(aDescriptor newMapping: DirectMapping) from: #plan to: (table fieldNamed: 'plan').
	(aDescriptor newMapping: DirectMapping) from: #budget to: (table fieldNamed: 'budget').
]

{ #category : #'as yet unclassified' }
AProjectDescriptorSystem >> tableForPROJECT: aTable [
	| parentField |
	(aTable createFieldNamed: 'id' type: platform serial) bePrimaryKey.
	aTable createFieldNamed: 'name' type: (platform varChar: 100).
	aTable createFieldNamed: 'description' type: (platform text).
	aTable createFieldNamed: 'business' type: (platform varChar: 100).
	aTable createFieldNamed: 'owner' type: (platform varChar: 100).
	aTable createFieldNamed: 'pm' type: (platform varChar: 100).
	parentField := aTable createFieldNamed: 'parent_id' type: platform integer.
	aTable addForeignKeyFrom: parentField to: ((self tableNamed: 'PROJECT') fieldNamed: 'id').
	aTable createFieldNamed: 'status' type: (platform varChar: 100).
	aTable createFieldNamed: 'audience' type: (platform text).
	aTable createFieldNamed: 'geography' type: (platform text).
	aTable createFieldNamed: 'effect' type: (platform text).
	aTable createFieldNamed: 'goal' type: (platform text).
	aTable createFieldNamed: 'tasks' type: (platform text).
	aTable createFieldNamed: 'kpi' type: (platform text).
	aTable createFieldNamed: 'partners' type: (platform text).
	aTable createFieldNamed: 'plan' type: (platform text).
	aTable createFieldNamed: 'budget' type: (platform text).
]
