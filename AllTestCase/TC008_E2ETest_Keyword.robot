*** Settings ***
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections

*** Variables ***
${base_url}  http://thetestingworldapi.com
${expected_status_code_post}  201
${expected_status_code_get}  200

*** Test Cases ***
TC001 Verify Student Creation
  [Tags]  Regression
  create session  Create_New_Student  ${base_url}
  &{body}=  create dictionary  first_name=Sumanta  middle_name=Kumar  last_name=Pal  date_of_birth=20/09/1981
  &{header}=  create dictionary  Content-Type=application/json

  ${response}=  post request   Create_New_Student  /api/studentsDetails  headers=${header}  data=${body}
  ${actual_response_status_code}=  convert to string  ${response.status_code}
  should be equal  ${actual_response_status_code}  ${expected_status_code_post}

  #retrive the student id after post
  ${json_response}=  to json  ${response.content}
  @{student_id_list}=  get value from json  ${json_response}  id
  ${student_id}=  get from list  ${student_id_list}  0
  log to console  ${student_id}

  Fetch and Validate Student Details  ${student_id}
  #Get the data of newly created student
  #${response}=  get request   Create_New_Student  /api/studentsDetails/${student_id}
  #${actual_response_status_code}=  convert to string  ${response.status_code}
  #should be equal  ${actual_response_status_code}  ${expected_status_code_get}
  #log to console  ${response.content}

*** Keywords ***
Fetch and Validate Student Details
  [Arguments]  ${id}
  ${response}=  get request   Create_New_Student  /api/studentsDetails/${id}
  ${actual_response_status_code}=  convert to string  ${response.status_code}
  should be equal  ${actual_response_status_code}  ${expected_status_code_get}
  log to console  ${response.content}











