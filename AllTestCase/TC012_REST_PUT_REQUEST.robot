*** Settings ***
Library     RequestsLibrary
Library     Collections

*** Variables ***
${base_url}     https://jsonplaceholder.typicode.com/
${end_point}    posts/1
${resource}     posts/1


*** Test Cases ***
Update_Resource_Using_PUT_Request
    Create Session    my_session    ${base_url}
    ${body}=    Create Dictionary    title=Updated Title    body=Updated Body    userId=1    id=1
    ${response}=    PUT On Session    my_session    ${end_point}    json=${body}
    Log To Console    ${response.status_code}
    Log To Console    ${response.json()}
    Should Be Equal As Numbers    ${response.status_code}    200
