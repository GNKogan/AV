Class {
	#name : #AMySQLPlatform,
	#superclass : #MySQLPlatform,
	#category : #'AV-Finance'
}

{ #category : #'conversion-strings' }
AMySQLPlatform >> convertByteArrayToString: aByteArray for: aType [
	^aByteArray ifNotNil: [ aByteArray utf8Decoded ]
]

{ #category : #'conversion-strings' }
AMySQLPlatform >> padString: aString for: aType [
	^ super padString: (aString ifNil: aString ifNotNil: [ aString convertToEncoding: 'UTF8' ]) for: aType
]
