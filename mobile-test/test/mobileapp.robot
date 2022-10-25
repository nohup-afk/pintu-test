*** Settings ***
Library     AppiumLibrary
Library    BuiltIn
Library      FakerLibrary
Resource    ../keyword/common.robot


*** Variables ***
${username}                John smith
${useremail}               Jon@smith.com
${userpassword}            Jonnyherewego



*** Test Cases ***
Invalid Login    
    Open Mobile App application
    Input user Email        username@email.com
    Input user password    123123
    Click Button login
    Get Error Message    Wrong Email or Password

Register New user
    Open Mobile App application
    ${faker_name}=        FakerLibrary.first_name
    ${faker_email}=        FakerLibrary.email  
    Create Account    ${faker_name}        ${faker_email}   ${userpassword}  ${userpassword}
    Get Register Message    Registration Successful

Register already registered profile
    Open Mobile App application
    Create Account    ${username}         ${useremail}    ${userpassword}  ${userpassword}
    #Terkadang register dengan variable di atas ttp lolos , validasi element nya gk dibikin

Login To Apps
    Open Mobile App application
    Input user Email        ${useremail} 
    Input user password    ${userpassword} 
    Click Button login
    #login dengan variable di atas sering kena user not  registered


*** Keywords ***

Input user Email
    [Arguments]    ${args1}
    Input Text    com.loginmodule.learning:id/textInputEditTextEmail    ${args1}

Input user password
    [Arguments]    ${args1}
    Input Text    com.loginmodule.learning:id/textInputEditTextPassword    ${args1}  
    Hide Keyboard

Click Button login
    Click Element     com.loginmodule.learning:id/appCompatButtonLogin


Get Error Message
    [Arguments]    ${args1}
    Wait Until Page Contains Element    com.loginmodule.learning:id/snackbar_text
    Element Text Should Be    com.loginmodule.learning:id/snackbar_text  ${args1}


Create Account
    [Arguments]    ${name}    ${email}    ${pass}    ${confimPass}
    Click Element   com.loginmodule.learning:id/textViewLinkRegister
    Wait Until Page Contains Element      com.loginmodule.learning:id/textInputEditTextName 
    Input Text    com.loginmodule.learning:id/textInputEditTextName     ${name}
    Input Text    com.loginmodule.learning:id/textInputEditTextEmail    ${email}
    Input Text    com.loginmodule.learning:id/textInputEditTextPassword    ${pass}
    Input Text    com.loginmodule.learning:id/textInputEditTextConfirmPassword    ${confimPass}
    Click Element    	com.loginmodule.learning:id/appCompatButtonRegister


Get Register Message  
    [Arguments]    ${args1}
    Wait Until Page Contains Element      com.loginmodule.learning:id/snackbar_text 
    Element Text Should Be    com.loginmodule.learning:id/snackbar_text  ${args1}
