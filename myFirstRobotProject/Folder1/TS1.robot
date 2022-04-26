*** Settings ***
Library    SeleniumLibrary

Suite Setup    Log    I am entering into the Test Suite.    
Suite Teardown    Log    I am leaving from the Test Suite.    

Test Setup    Log    I am entering into the Test Case.    
Test Teardown    Log    I am leaving from the Test Case.    

Default Tags    Sanity Testing

*** Variables ***
${URL}    https://opensource-demo.orangehrmlive.com/index.php/auth/login
@{CREDENTIALS}    Admin    admin123
&{LOGINDATA}    Username=admin    Password=admin123

*** Keywords ***
LoginKW
    Input Text    xPath=//*[@id="txtUsername"]    @{CREDENTIALS}[0]             
    Input Password    xPath=//*[@id="txtPassword"]    &{LOGINDATA}[Password]
    Click Element    xPath=//*[@id="btnLogin"]
    
LogoutKW
    Sleep    4    
    Click Element    xPath=//*[@id="welcome"]    
    Click Element    xPath=/html/body/div[1]/div[1]/div[9]/ul/li[3]/a    
    Sleep    2
    
*** Test Cases ***
TC1:LogTest1
    [Tags]    Smoke Testing
    Log    Hello World1!!!
    
TC2:LogTest2
    [Tags]    Smoke Testing
    Log    Hello World2!!!
    Set Tags    Regression Testing
    Remove Tags    Smoke Testing
        
    
TC3:LogTest3
    Log    Hello World3!!!    
    
TC4:BrowserTest
    Open Browser    https://google.com    chrome
    Set Browser Implicit Wait    4
    Input Text    xPath=/html/body/div[1]/div[3]/form/div[1]/div[1]/div[1]/div/div[2]/input    Automation Step by Step    
    Sleep    2    
    Press Keys    name=q    ESCAPE
    Click Element    xPath=/html/body/div[1]/div[3]/form/div[1]/div[1]/div[3]/center/input[1]
    Click Element    xPath=/html/body/div[7]/div/div[10]/div/div[2]/div[2]/div/div/div[1]/div/div/div/div/div/div/div[1]/a/h3    
    Sleep    2    
    Close Browser 
    Log    Test Completed
    
TC5:LoginTest
    Open Browser    ${URL}    chrome
    Set Browser Implicit Wait    4
    LoginKW
    #    Input Text    xPath=//*[@id="txtUsername"]    @{CREDENTIALS}[0]             
    #    Input Password    xPath=//*[@id="txtPassword"]    &{LOGINDATA}[Password]
    #    Click Element    xPath=//*[@id="btnLogin"]
    LogoutKW
    #    Sleep    4    
    #    Click Element    xPath=//*[@id="welcome"]    
    #    Click Element    xPath=/html/body/div[1]/div[1]/div[9]/ul/li[3]/a    
    #    Sleep    2    
    Close Browser
    Log    Test Completed    
    Log    This test was executed by %{username} on %{os}    

TC6:PrintTest
    Log    This just commit change.
    
    