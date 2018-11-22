*** Settings ***
Library           Selenium2Library
Library           OperatingSystem
Library           String

Test Setup      Go to CPM
#Test Teardown       Close Browser

*** Variables ***
${BROWSER}            Chrome      #phantomjs  
${GOOGLE URL}    https://dev.cpm.set/#/market-level/market-level

*** Test case ***
Check market performance
    Check data table market performance
    Check data table market show 2 row
    Click export file excel
#    Check data graphs
   # ค้นหาคำว่าsprint3r
   # รอจนกว่าจะเจอคำว่าsprint3r




*** Keywords ***
Go to CPM
   Open Browser    ${GOOGLE URL}    ${BROWSER}

Check data table market performance
    Wait Until Element Is Visible       //html/body/app-dashboard/app-sidebar/div/div/nav/ul/li[5]/a
    Click Link                          //html/body/app-dashboard/app-sidebar/div/div/nav/ul/li[5]/a
    Wait Until Element Is Visible       //html/body/app-dashboard/app-sidebar/div/div/nav/ul/li[5]/ul[6]/li/a
    Click Link                          //html/body/app-dashboard/app-sidebar/div/div/nav/ul/li[5]/ul[6]/li/a
    Input Text                          searchBoxInput          DNA
    Press Key      searchBoxInput     \\13
    Wait Until Page Contains            NP
    
Check data table market show ${row} row
    Wait Until Page Contains Element        //html/body/app-dashboard/app-sidebar/div/main/div/app-revenue-contribution-screen/div/div/app-company-header/div/div[${row}]

Click export file excel
    Wait Until Element Is Visible           //html/body/app-dashboard/app-sidebar/div/main/div/app-revenue-contribution-screen/div/div/app-company-header/div/div[1]/div[2]/div/app-export-button/div/div[1]
    Click Element           //html/body/app-dashboard/app-sidebar/div/main/div/app-revenue-contribution-screen/div/div/app-company-header/div/div[1]/div[2]/div/app-export-button/div/div[1]/span
    Wait Until Element Is Visible       exportItemList
    Click Element           exportItemList
    Sleep   2s
    Check for file withholding tax certificate                ~/Downloads/Revenue Contribution.xlsx
    Sleep   2s
    Check how to remove a file           ~/Downloads             Revenue Contribution.xlsx
#    Page Should Contain             Market Performanc
#    Wait Until Element Is Visible     Xpath=//*[@id=“mat-tab-content-0-0”]/div/app-market-level-summary/div/div[1]/div/div[2]/app-market-performance/div/div[3]/table/tbody[1]/tr[1]/th
#    Wait Until Page Contains            SET    

# Check data graphs
#    Wait Until Element Is Visible      chartdiv
#    Wait Until Page Contains            Index (Point)

Check for file withholding tax certificate
   [Arguments]    ${path}
   File Should Exist           ${path}

Check how to remove a file
   [Arguments]                 ${path}   ${fileName}
   File Should Exist           ${path}${/}${fileName}
   Remove File                 ${path}${/}${fileName}
   File Should Not Exist       ${path}${/}${fileName}