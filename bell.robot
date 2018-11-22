*** Settings ***
Library             SeleniumLibrary
Suite Setup         Open browser facebook
# Suite Teardown      Close All Browsers



*** Test Cases ***
Facebook
    login with facebook



*** Keywords ***
Open browser facebook
    Open Browser        https://www.facebook.com/    browser=chrome
    Set Window Size    1280    1024
    
login with facebook
    Wait Until Element Is Enabled       email
    # Input Text      email       xxxx
    # Input Text      pass        xxxx
    # Click Button        u_0_2