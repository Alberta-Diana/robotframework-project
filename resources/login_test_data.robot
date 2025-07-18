*** Variables ***

@{LOGIN TEST SETS}
	...		tomsmith		SuperSecretPassword!	success
	...		tomsmith		wrongpassword			failure
	...		invaliduser		SuperSecretPassword!	failure
	...		${EMPTY}		SuperSecretPassword!	failure
	...		tomsmith		${EMPTY}				failure
