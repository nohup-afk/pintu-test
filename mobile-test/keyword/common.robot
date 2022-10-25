*** Settings ***
Library    AppiumLibrary
Library    BuiltIn


*** Variables ***
${pathApp}    ${CURDIR}/sampleLogin.apk
${ANDROID_PLATFORM_VERSION}   %{ANDROID_PLATFORM_VERSION=8}






*** Keywords ***
Open Mobile App application    
    Open Application    http://127.0.0.1:4723/wd/hub    automationName=UIAutomator2
    ...    platformName=Android    app=${pathApp}     platformVersion=${ANDROID_PLATFORM_VERSION}