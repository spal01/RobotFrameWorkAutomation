*** Settings ***
Library     RequestsLibrary
Library     Collections
Library     JSONLibrary

*** Variables ***
${base_url}  https://reqres.in

*** Test Cases ***
TC01 Validate_Get_Request_with_parameter
    create session  Fetch_Details  ${base_url}
    &{param}=  create dictionary  page=2
    ${response}=  get request  Fetch_Details  /api/users  params=${param}
    log to console  ${response.content}


