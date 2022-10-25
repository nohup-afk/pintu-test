###How to run api test
    
    install python 
    
    pip install robotframework
    
    robot --version
        
    pip install robotframework-requests

change directory to
    
    cd pintu-test/API test

robot api.robot


###How to run mobile test
    
    install python 
    
    pip install robotframework

    robot --version
       
    pip install --upgrade robotframework-appiumlibrary


    Install Appium

if android home not set in env windows

    Set ANDROID_HOME 
      
      set ANDROID_HOME=C:\ *installation location* \android-sdk
      set PATH=%PATH%;%ANDROID_HOME%\tools;%ANDROID_HOME%\platform-tools

change directory to
    
        cd pintu-test/mobile-test/test

        robot mobileapp.robot
