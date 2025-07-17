
*** Settings ***
Library		SeleniumLibrary

*** Keywords ***
Open Browser to Login Page
	Open Browser 	${LOGIN_URL}	${BROWSER}
	Maximize Browser Window

Input Username And Password
	[Arguments] 	${username} 	${password}
	Input Text 		id=username		${username}
	Input Text		id=password		${password}


Click Login Button
	Click Button	xpath=//button[@type='submit']
