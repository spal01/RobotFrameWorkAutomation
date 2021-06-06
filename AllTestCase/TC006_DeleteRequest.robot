*** Settings ***
Library  JSONLibrary
Library  RequestsLibrary
Library  Collections
*** Variables ***
${base_url}  http://thetestingworldapi.com
${student_id}  215304
*** Test Cases ***
TC001 VERIFY DELETE OPERATION
    create session  DELETE_ONE_STUDENT  ${base_url}
    ${response}=  delete request  DELETE_ONE_STUDENT  /api/studentsDetails/${student_id}

    ${actual_response_code}=  convert to string  ${response.status_code}
    should be equal    ${actual_response_code}  200

    ${json_response}=  to json  ${response.content}
    @{status_list}=  get value from json  ${json_response}  status
    ${actual_status}=  get from list  ${status_list}  0
    should be equal  ${actual_status}  true


