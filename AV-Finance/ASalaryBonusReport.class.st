Class {
	#name : #ASalaryBonusReport,
	#superclass : #ASalaryReport,
	#instVars : [
		'bonus1',
		'bonus2'
	],
	#category : #'AV-Finance'
}

{ #category : #accessing }
ASalaryBonusReport >> bonus1 [
	^ bonus1
]

{ #category : #accessing }
ASalaryBonusReport >> bonus1: anInteger [ 
	bonus1 := anInteger
]

{ #category : #accessing }
ASalaryBonusReport >> bonus2 [
	^ bonus2
]

{ #category : #accessing }
ASalaryBonusReport >> bonus2: anInteger [ 
	bonus2 := anInteger
]

{ #category : #initialization }
ASalaryBonusReport >> setUp: aData [
	"comment stating purpose of message"

	super setUp: aData.
	bonus1 := (aData at: #perc1) ifNil: [ 0 ] ifNotNil: [ :a | (a trimRight: [ :c | c = $% ]) asNumber].
	bonus2 := (aData at: #perc2) ifNil: [ 0 ] ifNotNil: [ :a | (a trimRight: [ :c | c = $% ]) asNumber]
]

{ #category : #accessing }
ASalaryBonusReport >> total [
	^ agreement payment total: bonus1 bonus2: bonus2
]
