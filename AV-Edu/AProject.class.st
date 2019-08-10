Class {
	#name : #AProject,
	#superclass : #Object,
	#instVars : [
		'id',
		'parent',
		'name',
		'description',
		'business',
		'owner',
		'pm',
		'children',
		'status',
		'audience',
		'geography',
		'effect',
		'goal',
		'tasks',
		'kpi',
		'partners',
		'plan',
		'budget'
	],
	#category : #'AV-Edu'
}

{ #category : #'as yet unclassified' }
AProject >> children [
	^ children
]

{ #category : #'as yet unclassified' }
AProject >> description [
	^ description
]

{ #category : #'as yet unclassified' }
AProject >> description: aString [ 
	description := aString
]

{ #category : #accessing }
AProject >> details [
	^ OrderedDictionary newFrom: { 'Описание' -> description. 'Бизнес-заказчик' ->  business. 'Владелец проекта' -> owner. 'Руководитель проекта' -> pm. 'Стадия' -> status. 'Целевая аудитория' -> audience. 'География проекта' -> geography. 'Решаемая проблема (для ЦА)' -> effect. 'Цель проекта' -> goal. 'Задачи' -> tasks. 'Критерии успеха' -> kpi. 'Партнёры' -> partners. 'Календарный план' -> plan. 'Бюджет' -> budget}
]

{ #category : #'as yet unclassified' }
AProject >> initRoot [
	id := 1.
	name := 'Пиком'.
]

{ #category : #initialization }
AProject >> initialize [
	super initialize.
	children := OrderedCollection new
]

{ #category : #accessing }
AProject >> name [
	^ name
]
