*** Settings ***
Library  JSONLibrary
Library  RequestsLibrary
Library  Collections
Library  ../ReadContent/ReadFile.py

*** Variables ***
${base_url}  http://thetestingworldapi.com
${expected_status_code_get}  200

*** Keywords ***
Fetch and Validate Student Details
  [Documentation]  This keyword for get particular student details
  [Arguments]  ${id}
  create session  Get_Student_Data  ${base_url}
  ${response}=  get request   Get_Student_Data  /api/studentsDetails/${id}
  ${actual_response_status_code}=  convert to string  ${response.status_code}
  should be equal  ${actual_response_status_code}  ${expected_status_code_get}
  #log to console  ${response.content}

Fetch and Get Response
  [Arguments]  ${id}
  create session  GET_Send_Response  ${base_url}
  ${response}=  get request   Get_Student_Data  /api/studentsDetails/${id}
  [Return]  ${response.content}


Fetch Body for Create Student
    ${data}=  read_file_content
    [Return]  ${data}
    #Todo

Start
    log to console  Test Execution started
End
    log to console  Test Execution stoped