*** Settings ***
Documentation       Check "LAMP 84 Full" ENGLISH vocabulary
Resource            ../../../../../Resources/resources.robot
Resource            ../../../../../Resources/vocabularyAssertions.robot

Suite Setup         Run Keywords    Delete Chat Editor Folder    AND    Open ChatEditor
Suite Teardown      Close ChatEditor

*** Test Cases ***
Validate "LAMP 84 Full" vocabulary
    Create new configuration of ChatEditor
    Select Words For Life (Nova Edition)
    Create english user
    Maximize the window
    Reach Library of vocabs
    Select vocabulary    name:English    name:LAMP    ${lamp84Full}

Assertions
    # Click on a button's text - LAMP 84 Full
    Set Resolution    ${window}    1800    800
    ${text}    Set Variable    finished
    Click On Button With Text    ${text}    WordsForLife\\lamp84Full\\finished.png    0.6

    Check to see if the user exist

    # Check to see if the dictionary's name is included in the text box - LAMP 84 Full
    RPA.Windows.Click    ${edit_mode_btn}
    ${message}=    RPA.Windows.Get Text    id:65535
    Should Contain    ${message}    The vocabulary "LAMP 84 Full"
    RPA.Windows.Click    id:7

    # Check to see if the dictionary's 'name' attribute is its actual name - LAMP 84 Full
    RPA.Desktop.Press Keys    alt    l
    RPA.Windows.Click    name:English
    RPA.Windows.Click    name:LAMP
    ${name}=    RPA.Windows.Get Attribute    name:"LAMP 84 Full (Current)"    Name
    Should Be Equal    ${name}    LAMP 84 Full (Current)
