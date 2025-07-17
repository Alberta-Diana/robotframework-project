
*** Settings ***
Library		SeleniumLibrary
Resource	../resources/variables.robot
Resource 	../keywords/browser_keywords.robot

*** Test Cases ***
Valid Login Test
	[Documentation]		Verifies REQ-LOGIN-001: Successful login with valid credentials.
	[Tags]		REQ-LOGIN-001		smoke 		login
	Open Browser to Login Page
	Input Username and Password 	tomsmith	SuperSecretPassword!
	Click Login Button
	Page Should Contain 	You logged into a secure area!
	Close Browser

Invalid Login Test - Empty Username
	[Documentation]		Verifies REQ-LOGIN-002: Login fails if username is empty.
	[Tags]		REQ-LOGIN-002		negative	login
	Open Browser to Login Page
	Input Username and Password		${EMPTY}	SuperSecretPassword!
	Click Login Button
	Page Should Contain		Your username is invalid!
	Close Browser

Invalid Login Test - Wrong password
	[Documentation]		Verifies REQ-LOGIN-003: Login fails if password is incorrect
	[Tags]		REQ-LOGIN-003		negative	login
	Open Browser To Login Page
	Input Username and Password		tomsmith	WrongPassword123
	Click Login Button
	Page Should Contain 	Your username is invalid!
	Close Browser

Invalid Login Test - Empty password
	[Documentation]		Verifies REQ-LOGIN-004: Login fails if password is empty
	[Tags] 		REQ-LOGIN-004 		negative 	login
	Open Browser To Login Page
	Input Username and Password		tomsmith 	${EMPTY}
	Click Login Button
	Page Should Contain 	Your username is invalid!
	Close Browser

Invalid Login Test - Empty Both Fields
	[Documentation]		Verifies REQ-LOGIN-005: Login fails if both username and password are empty
	[Tags]		REQ-LOGIN-005 		negative 	login
	Open Browser To Login Page
	Input Username and Password 	${EMPTY}	${EMPTY}
	Click Login Button
	Page Should Contain 	Your username is invalid!
	Close Browser


