*** Settings ***
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections
*** Variables ***
${First_Name}  Sumanta
${Last_Name}  Pal
${Base_URL}  http://thetestingworldapi.com
${Student_id}  215146

*** Test Cases ***
TC_001_GET_REQUEST_NORMAL
    create session  Get_All_Student_Details  ${Base_URL}
    ${response}=  get request  Get_All_Student_Details  /api/studentsDetails
    #log to console  ${response.status_code}
    log to console  ${response.content}
    ${actual_status_code}=  convert to string  ${response.status_code}
    should be equal  ${actual_status_code}  200

TC_002_GET_REQUEST_JSON
    create session  Particular_Student_Detail  ${Base_URL}
    ${response}=  get request  Particular_Student_Detail  /api/studentsDetails/${Student_id}
    ${json_response}=  to json  ${response.content}
    @{first_name_list}=  get value from json  ${json_response}  data.first_name
    log to console  ${first_name_list}
    ${first_name}=  get from list  ${first_name_list}  0
    log to console  ${first_name}
    should be equal as strings  ${first_name}  Sumanta

TC_003_String_Compare
    [Tags]  Regression
    ${url}=  set variable  HalloWorld
    log to console  ${url}
    log to console  ${First_Name}
    log to console  ${Last_Name}
    should be equal  ${First_Name}  Sumanta
    should be equal as strings  ${Last_Name}  Pal