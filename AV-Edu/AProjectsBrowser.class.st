Class {
	#name : #AProjectsBrowser,
	#superclass : #ABrowser,
	#instVars : [
		'session'
	],
	#category : #'AV-Edu'
}

{ #category : #building }
AProjectsBrowser >> buildBrowser [

	browser :=  GLMTabulator new.
	browser
		row: #projects;
		row: [ :r | 
			r
				column: #description size: 500;
				column: #editor];
		title: 'Проекты'.
	browser transmit
		to: #projects;
		andShow: [ :a | a custom: self projectsBrowser ].
	browser transmit
		from: #projects;
		to: #description;
		andShow: [ :a | self projectDescription: a ].
	browser transmit
		from: #description;
		to: #editor;
		andShow: [ :a | self projectEditor: a ].
	^ browser
	
"[ :a | 
			(a
				custom:
					(AStaffBrowser new buildBrowser
						sendToOutside: #selectedJob from: #stafftable -> #selection;
						yourself)) display: [ :dep | dep allEmployees ]"
]

{ #category : #actions }
AProjectsBrowser >> clear [
	"comment stating purpose of message"

	(session cacheForClass: AProject) expireAll "release".
	AProject allInstancesDo: [ : instance | session cacheRemoveObject: instance ].
	Smalltalk garbageCollect.
]

{ #category : #'initialize-release' }
AProjectsBrowser >> close [
	session logout
]

{ #category : #initialization }
AProjectsBrowser >> initialize [
	"comment stating purpose of message"

	| login accessor |
	login := Login new
		database: AMySQLPlatform new;
		username: 'picom';
		password: 'picom';
		host: 'localhost';
		port: '3306';
		databaseName: 'av'.
	accessor := DatabaseAccessor forLogin: login.
	accessor isLoggedIn ifFalse: [ accessor login ].
	session := AProjectDescriptorSystem sessionForAccessor: accessor.
	self load
	"session recreateTables."
]

{ #category : #loading }
AProjectsBrowser >> load [
	session read: AProject
]

{ #category : #querying }
AProjectsBrowser >> organizer [
	^ AProject allInstances at: 52
]

{ #category : #'as yet unclassified' }
AProjectsBrowser >> projectDescription: a [
	| collection |
	collection := OrderedCollection new.
	a list display: [ :project | project details associationsDo: [ :assoc | collection add: (assoc key, ': ', (assoc value ifNil: [ '' ] ifNotNil: [ :s | s ])) ]. collection ]; title: [ :project | project name] .
]

{ #category : #'as yet unclassified' }
AProjectsBrowser >> projectEditor: a [
	a text
]

{ #category : #'as yet unclassified' }
AProjectsBrowser >> projectsBrowser [
	| browser1 |
	browser1 := GLMFinder new variableSizePanes; yourself.
	browser1 show: [:a | a list display: #children; format: #name ].
	"browser openOn: arr."
	^ browser1
]

{ #category : #actions }
AProjectsBrowser >> reload [
	self clear.
	self load
	
]
