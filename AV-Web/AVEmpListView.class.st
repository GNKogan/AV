Class {
	#name : #AVEmpListView,
	#superclass : #WAComponent,
	#category : #'AV-Web'
}

{ #category : #initialization }
AVEmpListView class >> initialize [
	"self initialize"
	WAAdmin register: self asApplicationAt: 'emp'
]

{ #category : #adding }
AVEmpListView >> add [
	self model add: (AJobAgreement new)
]

{ #category : #actions }
AVEmpListView >> edit: anItem [
	self inform: anItem name.
	self call: (AVEmployeeView new model: anItem)
]

{ #category : #accessing }
AVEmpListView >> model [
	"comment stating purpose of message"

	^ AWorld employs
]

{ #category : #removing }
AVEmpListView >> remove: anItem [
	(self confirm: 'Are you sure you want to remove ' , anItem name printString , '?')
        ifTrue: [ self model remove: anItem ]
]

{ #category : #rendering }
AVEmpListView >> renderContentOn: html [
	html heading: 'Сотрудники'.
	html
		form: [ html anchor
				callback: [ self add ];
				with: 'add'.
			html unorderedList: [ self renderItemsOn: html ].
			html submitButton: 'Save' ]
]

{ #category : #rendering }
AVEmpListView >> renderItem: anItem on: html [
	html listItem
		with: [ "class: 'done' if: anItem isDone; class: 'overdue' if: anItem isOverdue;"
			html checkbox
				value: anItem done;
				callback: [ :value | anItem done: value ].
			html render: anItem person displayString.
			html space.
			html anchor
				callback: [ self edit: anItem ];
				with: 'edit'.
			html space.
			html anchor
				callback: [ self remove: anItem ];
				with: 'remove' ]
]

{ #category : #rendering }
AVEmpListView >> renderItemsOn: html [
	"comment stating purpose of message"

	 self model do: [ :each | self renderItem: each on: html ]
]
