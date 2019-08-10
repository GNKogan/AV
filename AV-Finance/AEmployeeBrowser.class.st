Class {
	#name : #AEmployeeBrowser,
	#superclass : #ABrowser,
	#category : #'AV-Finance'
}

{ #category : #building }
AEmployeeBrowser >> buildBrowser [
	"comment stating purpose of message"

	browser := GLMTabulator new.
	browser row: #row.
	browser transmit
		to: #row;
		andShow: [ :a | 
			a text display: [ :job | job person name, String cr, job department displayString, String cr, job position ] ].
	^ browser
]
