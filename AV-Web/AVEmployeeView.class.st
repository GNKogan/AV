Class {
	#name : #AVEmployeeView,
	#superclass : #Object,
	#instVars : [
		'model'
	],
	#category : #'AV-Web'
}

{ #category : #accessing }
AVEmployeeView >> model [
	^ model
]

{ #category : #accessing }
AVEmployeeView >> model: aModel [
	model := aModel
]

{ #category : #rendering }
AVEmployeeView >> renderContentOn: html [
	html heading: 'Edit'.
	html
		form: [ html
				text: 'Title:';
				break.
			html textInput
				value: self model title;
				callback: [ :value | self model title: value ].
			html break.
			html
				text: 'Due:';
				break.
			html dateInput
				value: self model due;
				callback: [ :value | self model due: value ].
			html break.
			html submitButton
				callback: [ self answer: self model ];
				text: 'Save'.
			html cancelButton
				callback: [ self answer: nil ];
				text: 'Cancel' ]
]
