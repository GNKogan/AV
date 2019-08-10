"
Payment is calculated based on the report for a certain period. Employee payment consists of  three parts:
1) main part is calculated according to his salary scheme,
2) extra (irregular) bonus,
3) extra (irregular) penalties.
4) payments for any corporate programs (affiliate, recomendation, comission).

Salary schemes are:
1) monthly salary. Could be fixed salary or include varialble bonus plus to the salary. Indexed according to worldays. Actually it could be used for any fixed period not just month (week, decade, individual interval)
2) hourly wages (same as for T&M agreement)
3) fixed price for a fixed piece of work (same as for FixedPrice agreement)
4) comission based on sales (same as for comission/agent agreements)

There are also non-salary payments to employees (via separate agreements):
1) Aid
2) credit
benefits

Overtime
Income tax
Deductions //other taxes
Earnings, Emoluments, Remuneration
Expenses
Gross salary, net salary, net pay
Fees
Sick(ness) pay
Maternity allowance is a benefit for working pregnant women who are unable to get statutory maternity pay
Pay rate

Cобытие -> Начисление -> Выплата
comission: Оплата клиента -> Начисление (но размер начисления может зависеть от месячного плана)
salary: Конец месяца (или как в договоре)
aid: Событие
ПД: Выход на работу/Конец вводного периода

Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:

For the Class part:  State a one line summary. For example, ""I represent a paragraph of text"".

For the Responsibility part: Three sentences about my main responsibilities - what I do, what I know.

For the Collaborators Part: State my main collaborators and one line about how I interact with them. 

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	salary:		<Object>


    Implementation Points
"
Class {
	#name : #AEmployeePayment,
	#superclass : #APayment,
	#instVars : [
		'salary'
	],
	#category : #'AV-Finance'
}

{ #category : #'as yet unclassified' }
AEmployeePayment class >> d1: aSalary d2: aRate d3: aBonus [
	"comment stating purpose of message"

	aBonus ifNotNil: [ ^ ASalaryBonusPayment new salary: aSalary; bonus1: aBonus ].
	aSalary ifNotNil: [ ^ ASalaryPayment new salary: aSalary ].
	aRate ifNotNil: [ ^ AHourlyPayment new rate: aRate ].
]

{ #category : #'as yet unclassified' }
AEmployeePayment class >> d1: aSalary d2: aRate d3: aBonus d4: aBonus2 [
	"comment stating purpose of message"

	aBonus ifNotNil: [ ^ ASalaryBonusPayment new salary: aSalary; bonus1: aBonus; bonus2: aBonus2 ].
	aSalary ifNotNil: [ ^ ASalaryPayment new salary: aSalary ].
	aRate ifNotNil: [ ^ AHourlyPayment new rate: aRate ].
]

{ #category : #accessing }
AEmployeePayment >> bonus1 [
	^ ''
]

{ #category : #'as yet unclassified' }
AEmployeePayment >> rate [
	^ ''
]

{ #category : #'as yet unclassified' }
AEmployeePayment >> salary [
	^ salary
]

{ #category : #accessing }
AEmployeePayment >> salary: anInteger [ 
	salary := anInteger asInteger.
]

{ #category : #accessing }
AEmployeePayment >> total [
	^ salary
]
