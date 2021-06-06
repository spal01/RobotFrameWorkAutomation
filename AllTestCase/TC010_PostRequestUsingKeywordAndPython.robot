*** Settings ***
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections
Resource  ../Resource/UserKeyword.robot
*** Variables ***
${base_url}  http://thetestingworldapi.com
*** Test Cases ***
TC001 Varify POST Operation
    [Documentation]  This verifies the POST Operation by using keyword
    [Tags]  Regression
    [Setup]  Start
    #log to console  ${base_url}
    create session  ADD_NEW_STUDENT  ${base_url}
    #Creating the data list using dictionary
    #&{body}=  create dictionary  first_name=Sumanta  middle_name=Kumar  last_name=Pal  date_of_birth=20/09/1981
    ${json_content}=  Fetch Body for Create Student
    &{header}=  create dictionary  Content-Type=application/json

    ${response}=  post request  ADD_NEW_STUDENT  /api/studentsDetails  data=${json_content}  headers=${header}
    ${actual_response}=  convert to string  ${response.status_code}
    should be equal  ${actual_response}  201
    log to console  ${response.content}
    [Teardown]  End
