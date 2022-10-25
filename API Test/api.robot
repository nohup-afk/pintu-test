*** Settings ***
Library           RequestsLibrary
Library           Collections

*** Variables ***
${url}    https://jsonplaceholder.typicode.com
${userid}      /posts
${payload}        { "title": "recomendation", "body": "motorcycle", "userId": 12 }



*** Test Cases ***
Validate resp header shoud be valid
    Find user id

Quick JSON body Test
    Validate Body JSON
    
Post Request Test 
    Validate input response    recomendation       motorcycle    12

*** Keywords ***
Find user id
    Create Session    userapi    ${url}
    ${headers}=    Create Dictionary    Content-Type=application/json
    ${resp}=    Get On Session    userapi    ${userid}    headers=${headers}
    Status Should Be    200   

Validate Body JSON
    Create Session    userapi    ${url}
    ${headers}=    Create Dictionary    Content-Type=application/json
    ${resp}=    Get On Session    userapi    ${userid}    headers=${headers}   
    Log To Console    ${resp.json()[0]}
    Should Be Equal As Integers       ${resp.json()[0]}[id]               1
    Should Be Equal As Integers       ${resp.json()[0]}[userId]           1
    Should Be Equal As Strings        ${resp.json()[0]}[title]            sunt aut facere repellat provident occaecati excepturi optio reprehenderit  
    Should Be Equal As Strings        ${resp.json()[0]}[body]             quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto 


Validate input response
    [Arguments]    ${args1}      ${args2}    ${args3}    
    Create Session    userapi    ${url}
    ${headers}=    Create Dictionary    Content-Type=application/json
    ${resp}=    POST On Session    userapi     ${userid}   data=${payload}   headers=${headers}      expected_status=anything
    Log To Console     ${resp.json()}
    Status Should Be                 201  ${resp}  
    Should Be Equal As Strings           ${resp.json()}[title]       ${args1}
    Should Be Equal As Strings           ${resp.json()}[body]        ${args2}
    Should Be Equal As Strings           ${resp.json()}[userId]      ${args3} 
