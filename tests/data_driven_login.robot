
*** Settings ***
Library 		SeleniumLibrary
Resource		../keywords/browser_keywords.robot
Resource		../resources/login_test_data.robot
Resource		../resources/variables.robot


*** Test Cases ***
Login Test with Multple Credentials
	FOR		${username}		${password}		${expected} 	IN 		@{LOGIN TEST SETS}
		Log 	Testing with: ${username} / ${password}
		Open Browser To Login Page
		Input Username and Password		${username}		${password}
		Click Login Button
		Run Keyword If 		'${expected}' == 'success'		Page Should Contain		You logged into a secure area!
		Run Keyword If		'${expected}' == 'failed'		Page Should Contain		Your username is invalid!
		Close Browser
	END
