*** Settings ***
Documentation       Check "Gateway 40 Teen" ENGLISH vocabulary

Resource            ../../../../../Resources/resources.robot
Resource            ../../../../../Resources/vocabularyAssertions.robot

Suite Setup         Run Keywords    Delete Chat Editor Folder    AND    Open ChatEditor
Suite Teardown      Close ChatEditor


*** Test Cases ***
Validate "Gateway 40 Teen" vocabulary
    Create new configuration of ChatEditor
    Select Touch Chat
    Select English
    Select Symbol Set: SymbolStix with Gateway aditional vocabulary
    Create English user
    Maximize the window
    Reach Library of vocabs
    Select vocabulary    name:English    name:SymbolStix    name:Gateway    ${gateway40Teen}

Assertions for "Gateway 40 Teen" vocabulary
    Check to see if the user exist

    # Check to see if the name of the vocabulary is included in the text box - Gateway 40 Teen
    Set Resolution    ${window}    1800    800
    RPA.Windows.Click    ${edit_mode_btn}
    ${message}=    RPA.Windows.Get Text    id:65535
    Should Contain    ${message}    The vocabulary "Gateway 40 Teen"
    RPA.Windows.Click    id:7

    # Check to see if the vocabulary 'name' attribute is its actual name - Gateway 40 Teen
    RPA.Desktop.Press Keys    alt    l
    RPA.Windows.Click    name:English
    RPA.Windows.Click    name:SymbolStix
    RPA.Windows.Click    name:Gateway
    ${name}=    RPA.Windows.Get Attribute    name:"Gateway 40 Teen (Current)"    Name
    Should Be Equal    ${name}    Gateway 40 Teen (Current)
