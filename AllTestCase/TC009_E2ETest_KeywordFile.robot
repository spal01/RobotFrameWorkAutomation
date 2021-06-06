*** Settings ***
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections
Resource  ../Resource/UserKeyword.robot

*** Variables ***
${base_url}  http://thetestingworldapi.com
${student_id}  77769


*** Test Cases ***
TC001 GET STUDENT DETAILS BY ID
  Fetch and Validate Student Details  ${student_id}
  ${content}=  Fetch and Get Response  ${student_id}
  log to console  ${content}












