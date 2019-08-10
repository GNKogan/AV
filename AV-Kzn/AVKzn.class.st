Class {
	#name : #AVKzn,
	#superclass : #Object,
	#instVars : [
		'crawler'
	],
	#category : #'AV-Kzn'
}

{ #category : #'as yet unclassified' }
AVKzn >> getCategories [
	"comment stating purpose of message"

	^self getPage: 'organizacii' andParse: '<p class="name">\s*<a href="(/organizacii/[a-zA-Z\-]+)">'
]

{ #category : #'as yet unclassified' }
AVKzn >> getMail: aPath [
	"comment stating purpose of message"

	^(self getPage: aPath andParse: '<li class="email">([a-zA-Z0-9\-@_.]+)<\/li>') at: 1 ifAbsent: nil
]

{ #category : #'as yet unclassified' }
AVKzn >> getOrganizations: aPath [
	"comment stating purpose of message"

	| page paths result |
	page := 1.
	paths := OrderedCollection new.

	[ result := self getPage: ('{1}?page={2}' format: {aPath. page}) andParse: '<p class="name">\s*<a href="(/organizacija/[a-zA-Z0-9\-]+)">']
	whileNotNil: [ page := page +1. paths addAll: result ].
	^paths
]

{ #category : #'as yet unclassified' }
AVKzn >> getPage: aString [
	"comment stating purpose of message"

	| page |
	page := crawler path: aString; get.
	(self is404: page) ifTrue: [ ^nil ] ifFalse: [ ^page ]
	
]

{ #category : #'as yet unclassified' }
AVKzn >> getPage: aPath andParse: aPattern [
	"comment stating purpose of message"

	| paths page |
	page := self getPage: aPath.
	page ifNil: [ ^nil ].
	paths := OrderedCollection new.
	"(self getPage: aPath) regex: aPattern matchesDo: [ :link | self logCr: (link subexpression: 1) ]."
	aPattern asRegex matchesIn: page subexpressionsDo: [ :match :link | paths add: link first].
	^ paths
]

{ #category : #'as yet unclassified' }
AVKzn >> initialize [
	"comment stating purpose of message"

	crawler := ZnClient new host: 'kazan.ru'.
]

{ #category : #'as yet unclassified' }
AVKzn >> is404: aPage [
	"comment stating purpose of message"

	^(crawler response) code = 404
]

{ #category : #'as yet unclassified' }
AVKzn >> start [
	"comment stating purpose of message"

	self getCategories
		do: [ :category | 
			| orgs |
			orgs := self getOrganizations: category.
			orgs
				do: [ :o | 
					| mail |
					mail := self getMail: o.
					mail ifNotNil: [ self logCr: mail ] ] ]
]
