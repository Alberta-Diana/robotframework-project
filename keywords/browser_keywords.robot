
*** Settings ***
Library		SeleniumLibrary

*** Keywords ***
Open Browser to Login Page
	Open Browser 	${LOGIN_URL}	${BROWSER}
	Maximize Browser Window

Input Username And Password
	[Arguments] 	${username} 	${password}
	Log			Input username: ${username}
	Input Text 		id=username		${username}
	Input Text		id=password		${password}


Click Login Button
	Wait Until Element is Visible		xpath=//button[@type='submit']		timeout=5s
	Click Button	xpath=//button[@type='submit']

CLick Logout Button
	Wait Until Element is Visible		xpath=//a[@href='/logout']
	Click Element 	xpath=//a[@href='/logout']
