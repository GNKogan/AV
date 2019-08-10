Class {
	#name : #ACompanyBrowser,
	#superclass : #ABrowser,
	#category : #'AV-Finance'
}

{ #category : #building }
ACompanyBrowser >> buildBrowser [
	"comment stating purpose of message"

	browser := GLMTabulator new.
	browser
		row: [ :r | 
			r
				column: #departments size: 150;
				column: #staff ] size: 400;
		row: [ :r | 
			r
				column: #empInfo size: 100;
				column: #empHistory size: 400;
				column: #empReports size: 300;
				column: #empPayments];
		title: 'Сотрудники'.
	browser transmit
		to: #departments;
		andShow: [ :a | 
			a tree
				children: [ :root :each | root departments ];
				format: #name	"display: [ :each | each departments ];" ].
	browser transmit
		from: #departments;
		to: #staff;
		andShow: [ :a | 
			(a
				custom:
					(AStaffBrowser new buildBrowser
						sendToOutside: #selectedJob from: #stafftable -> #selection;
						yourself)) display: [ :dep | dep allEmployees ] ].
	browser transmit
		from: #staff port: #selectedJob;
		to: #empInfo;
		andShow: [ :a | a custom: AEmployeeBrowser new buildBrowser ].
	browser transmit
		from: #staff port: #selectedJob;
		to: #empHistory;
		andShow: [ :a | a custom: (AStaffBrowser new buildBrowser display: [ :job | job history ]) ].
	browser transmit
		from: #staff port: #selectedJob;
		to: #empReports;
		andShow: [ :a | a custom: (AEmployeePaymentsBrowser new buildBrowser display: [ :job | job reports ]) ].
	browser transmit
		from: #empReports port: #selectedReport;
		to: #empPayments;
		andShow: [ :a | a custom: (AEmployeePaymentsBrowser new buildBrowser display: [ :job | job reports ]) ].

]

{ #category : #querying }
ACompanyBrowser >> organizer [
	"comment stating purpose of message"

	^ ADepartment findByName: 'Пиком'
]
