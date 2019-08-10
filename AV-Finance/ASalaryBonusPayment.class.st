Class {
	#name : #ASalaryBonusPayment,
	#superclass : #AEmployeePayment,
	#instVars : [
		'bonus1',
		'bonus2'
	],
	#category : #'AV-Finance'
}

{ #category : #accessing }
ASalaryBonusPayment >> bonus1 [
	^ bonus1
]

{ #category : #accessing }
ASalaryBonusPayment >> bonus1: anInteger [ 
	bonus1 := anInteger asInteger
]

{ #category : #accessing }
ASalaryBonusPayment >> bonus2 [
	^ bonus2
]

{ #category : #accessing }
ASalaryBonusPayment >> bonus2: anInteger [ 
	bonus2 := anInteger asInteger
]

{ #category : #initialization }
ASalaryBonusPayment >> initialize [
	bonus1 := 0.
	bonus2 := 0
]

{ #category : #accessing }
ASalaryBonusPayment >> total [
	^ self total: bonus1 bonus2: bonus2
]

{ #category : #accessing }
ASalaryBonusPayment >> total: aBonus bonus2: aBonus2 [
	^ salary * (aBonus/100+1+(aBonus2/100)).
]
