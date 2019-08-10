Class {
	#name : #AVWebApp,
	#superclass : #Object,
	#instVars : [
		'image'
	],
	#category : #'AV-Web'
}

{ #category : #accessing }
AVWebApp >> downloadPharoLogo [
	^ ZnClient new
		beOneShot;
		get: 'http://www.pharo.org/files/pharo.png';
		entity
]

{ #category : #'request handling' }
AVWebApp >> handleGetRequest: aRequest [
	^ (aRequest uri queryAt: #raw ifAbsent: [ nil ])
		ifNil: [ ZnResponse ok: (ZnEntity html: self html) ]
		ifNotNil: [ ZnResponse ok: self image ]
]

{ #category : #'request handling' }
AVWebApp >> handlePostRequest: aRequest [
	| part newImage |
	part := aRequest entity partNamed: #file.
	newImage := part entity.
	image := newImage.
	^ ZnResponse redirect: #image
]

{ #category : #public }
AVWebApp >> handleRequest: aRequest [
	aRequest uri path = #image
		ifTrue: [ aRequest method = #GET
				ifTrue: [ ^ self handleGetRequest: aRequest ].
			aRequest method = #POST
				ifTrue: [ ^ self handlePostRequest: aRequest ] ].
	^ ZnResponse notFound: aRequest uri
]

{ #category : #accessing }
AVWebApp >> html [
	^ '<html><head><title>Image</title>
	<body>
	<h1>Image</h1>
	<img src="image?raw=true"/>
	<br/>
	<form enctype="multipart/form-data" action="image" method="POST">
	<h3>Change the image:</h3>
	<input type="file" name="file"/>
	<input type="submit" value= "Upload"/>
	</form>
	</body></html>'
]

{ #category : #accessing }
AVWebApp >> image [
	^ image ifNil: [ image := self downloadPharoLogo ]
]

{ #category : #accessing }
AVWebApp >> value: aRequest [
	^ self handleRequest: aRequest
]
