*** Settings ***
Library    String

*** Testcases ***
Stable test
	Should Be True    ${True}

Unstable test
	${bool} =  random_boolean
	Should Be True    ${bool}

*** Keywords ***
random_boolean
	${nb_string} =  generate random string  1  [NUMBERS]
	${nb_int} =  convert to integer  ${nb_string}
	Run keyword and return  evaluate  (${nb_int} % 2) == 0