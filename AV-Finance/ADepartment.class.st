Class {
	#name : #ADepartment,
	#superclass : #AEntity,
	#instVars : [
		'departments',
		'employees'
	],
	#category : #'AV-Finance'
}

{ #category : #accessing }
ADepartment >> allEmployees [
	"all employees including subdepartments"

	^ self employees copy, (departments flatCollect: [ :dep | dep employees ])
]

{ #category : #accessing }
ADepartment >> departments [
	^ departments
]

{ #category : #accessing }
ADepartment >> employees [
	"comment stating purpose of message"

	^ employees
]

{ #category : #initialization }
ADepartment >> initialize [
	super initialize.
	departments := OrderedCollection new.
	employees := OrderedCollection new
]
