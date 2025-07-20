*** Settings ***
Library 		SeleniumLibrary
Resource		../keywords/browser_keywords.robot
Resource		../resources/variables.robot


*** Test Cases ***
Secure Page Testing Without Login
	[Documentation]			REQ-ACCESS-001: Unauthenticated users should not access secure pages.
	[Tags]		negative		access		security
	Open Browser 		${SECURE_URL}		${BROWSER}
	Page Should Contain		You must login to view the secure area!
	Close Browser


Secure Page Testing After Login
	[Documentation]			REQ-ACCESS-002:	Logged-in users should access the secure page.
	[Tags]		positive		access		security
	Open Browser to Login Page
	Input Username and Password		tomsmith		SuperSecretPassword!
	Click Login Button
	Go to 		${SECURE_URL}
	Page Should Contain			Welcome to the Secure Area.
	Close Browser
	
