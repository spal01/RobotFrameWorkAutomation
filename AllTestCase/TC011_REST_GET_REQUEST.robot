*** Settings ***
Library     RequestsLibrary
Library     Collections

*** Variables ***

 ${base_url}  https://jsonplaceholder.typicode.com/
 ${end_point}  posts/1
 ${url}=jkj


*** Test Cases ***
 Get_the_response_from_request
    create session  my_session  https://jsonplaceholder.typicode.com/
    ${response} =  get request  my_session  posts/1
    Log To Console  ${response.status_code}
    Log To Console  ${response.json()}



