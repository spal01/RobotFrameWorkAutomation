*** Settings ***
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections
*** Variables ***
${base_url}  http://thetestingworldapi.com
*** Test Cases ***
TC001 Verify PUT Operation
    [Tags]  Smoke
    create session  DATA_UPDATE  ${base_url}
    &{body}=  create dictionary  id= 215146  first_name=Sumanta  middle_name=KR last_name=Paul  date_of_birth=21/09/1981
    &{header}=  create dictionary  Content-Type=application/json
    ${response}=  put request  DATA_UPDATE  /api/studentsDetails/80128  data=${body}  headers=${header}
    log to console  ${response.status_code}
    log to console  ${response.content}

    ${json_response}=  to json  ${response.content}
    @{status_list}=  get value from json  ${json_response}  status
    ${actual_status}=  get from list  ${status_list}  0
    #log to console  ${actual_status}
    should be equal as strings  ${actual_status}  true

    ${response}=  get request  DATA_UPDATE  /api/studentsDetails/80128
    log to console  ${response.status_code}
    log to console  ${response.content}


