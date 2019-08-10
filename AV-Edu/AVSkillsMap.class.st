Class {
	#name : #AVSkillsMap,
	#superclass : #Object,
	#instVars : [
		'browser',
		'organizer'
	],
	#category : #'AV-Edu'
}

{ #category : #'as yet unclassified' }
AVSkillsMap class >> open [
	^ self new open
]

{ #category : #'instance creation' }
AVSkillsMap class >> openOn: anArray [
	^ self new open; organizer: anArray
]

{ #category : #'as yet unclassified' }
AVSkillsMap >> buildBrowser [
	browser := GLMTabulator new.
	browser
		column: #professions;
		column: #skills;
		column: #tasks;
		column: #books.
	browser transmit
		to: #professions;
		andShow: [ :a | self profIn: a ].
	browser transmit
		from: #professions;
		to: #skills;
		andShow: [ :a | self profIn: a ]
]

{ #category : #'as yet unclassified' }
AVSkillsMap >> open [
	self buildBrowser.
	browser openOn: self organizer.
]

{ #category : #'as yet unclassified' }
AVSkillsMap >> organizer [
	^ organizer
]

{ #category : #accessing }
AVSkillsMap >> organizer: anArray [
	organizer := anArray
]

{ #category : #'as yet unclassified' }
AVSkillsMap >> profIn: constructor [
	constructor list display: [:organizerr | organizerr children]; format: #asnameString
]
