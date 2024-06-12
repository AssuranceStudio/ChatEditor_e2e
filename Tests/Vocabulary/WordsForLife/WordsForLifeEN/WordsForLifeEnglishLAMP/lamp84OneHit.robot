*** Settings ***
Documentation       Check "LAMP 84 One Hit" ENGLISH vocabulary
Resource            ../../../../../Resources/resources.robot
Resource            ../../../../../Resources/vocabularyAssertions.robot

Suite Setup         Run Keywords    Delete Chat Editor Folder    AND    Open ChatEditor
Suite Teardown      Close ChatEditor

*** Test Cases ***
Validate "LAMP 84 One Hit" vocabulary
    Create new configuration of ChatEditor
    Select Words For Life (Nova Edition)
    Create english user
    Maximize the window
    Reach Library of vocabs
    Select vocabulary    name:English    name:LAMP    ${lamp84OneHit}

Assertions
    # Click on a button's text - LAMP 84 One Hit
    Set Resolution    ${window}    1800    800
    ${text}    Set Variable    little
    Click On Button With Text    ${text}    WordsForLife\\lamp84OneHit\\little.png    0.6
    ${message}=    RPA.Windows.Get Value    id:1000
    Should Contain    ${message}    Little

    Check to see if the user exist

    # Check to see if the dictionary's name is included in the text box - LAMP 84 One Hit
    RPA.Windows.Click    ${edit_mode_btn}
    ${message}=    RPA.Windows.Get Text    id:65535
    Should Contain    ${message}    The vocabulary "LAMP 84 One Hit"
    RPA.Windows.Click    id:7

    # Check to see if the dictionary's 'name' attribute is its actual name - LAMP 84 One Hit
    RPA.Desktop.Press Keys    alt    l
    RPA.Windows.Click    name:English
    RPA.Windows.Click    name:LAMP
    ${name}=    RPA.Windows.Get Attribute    name:"LAMP 84 One Hit (Current)"    Name
    Should Be Equal    ${name}    LAMP 84 One Hit (Current)
