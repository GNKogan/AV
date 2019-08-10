Class {
	#name : #AVGlorpTest,
	#superclass : #TestCase,
	#category : #'AV-Storage'
}

{ #category : #tests }
AVGlorpTest >> test [
	"comment stating purpose of message"

	| login accessor session |
	login := Login new
		database: MySQLPlatform new;
		username: 'picom';
		password: 'picom';
		host: 'localhost';
		port: '3306';
		databaseName: 'av'.
	accessor := DatabaseAccessor forLogin: login.
	accessor login.
	"login secure: true."
	"accessor isLoggedIn logCr ."
	"accessor basicExecuteSQLString: 'SELECT 3+4') contents first first"
	(accessor connection) execute: 'INSERT INTO good (id,name,nameFull)  VALUES (1,''','ываыв' asUTF8Bytes asWideString , ''',NULL)'.
	
	session := AVDescriptorSystem sessionForAccessor: accessor.
	"session := AVDescriptorSystem sessionForLogin: login.
	session login."

	"session createTables."
	
	
	session inUnitOfWorkDo: [ AVGood allInstancesDo: [ :each | session register: each ]].
]
