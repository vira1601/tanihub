*** Settings ***
Library                 RequestsLibrary
Library                 Collections
Library                 JSONLibrary


*** Variables ***
${base_url}             https://ghibliapi.herokuapp.com
${get_endpoint}         /vehicles/        


*** Test Cases ***
Get All Vehicles Info
    Create session                  get_vehicle             ${base_url}             verify=true
    ${headers}                      Create Dictionary       Content-Type=application/json

    ${response}=                    GET Request             get_vehicle     ${get_endpoint}
    ...                             headers=${headers}
    Should Be Equal As Strings      ${response.status_code}                 200
    Set Global Variable             ${response}
    Log To Console                  ${response.json()}

    ${vehicleID}=           Set Variable        ${response.json()[0]["id"]}
    Set Global Variable     ${vehicleID}
    ${vehicleID1}=           Set Variable        ${response.json()[1]["id"]}
    Set Global Variable     ${vehicleID1}
    ${vehicleID2}=           Set Variable        ${response.json()[2]["id"]}
    Set Global Variable     ${vehicleID2}

Get Vehicles List by ID1
    Create session                  get_vehicle_list             ${base_url}             verify=true
    ${headers}                      Create Dictionary       Content-Type=application/json

    ${response}=                    GET Request             get_vehicle_list     ${get_endpoint}/${vehicleID1}
    ...                             headers=${headers}
    Should Be Equal As Strings      ${response.status_code}                 200
    Set Global Variable             ${response}
    Log To Console                  ${response.json()}