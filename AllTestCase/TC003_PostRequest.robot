
*** Settings ***
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections
*** Variables ***
${base_url}  http://thetestingworldapi.com
*** Test Cases ***
TC001 Verify POST Operation
    [Tags]  Smoke
    #log to console  ${base_url}
    create session  ADD_NEW_STUDENT  ${base_url}
    #Creating the data list using dictionary
    &{body}=  create dictionary  first_name=Sumanta  middle_name=Kumar  last_name=Pal  date_of_birth=20/09/1981
    &{header}=  create dictionary  Content-Type=application/json

    ${response}=  post request  ADD_NEW_STUDENT  /api/studentsDetails  headers=${header}  data=${body}
    log to console  ${response.status_code}
    log to console  ${response.content}
    ${actual_response}=  convert to string  ${response.status_code}
    should be equal  ${actual_response}  201

    ${json_response}=  to json  ${response.content}
#    Take the data into the list
    @{student_id_list}=  get value from json  ${json_response}  id
    ${id}=  get from list  ${student_id_list}  0
    log to console  ${id}