*** Settings ***
Documentation       Check "Gateway 20 Child" ENGLISH vocabulary

Resource            ../../../../../Resources/resources.robot
Resource            ../../../../../Resources/vocabularyAssertions.robot

Suite Setup         Run Keywords    Delete Chat Editor Folder    AND    Open ChatEditor
Suite Teardown      Close ChatEditor


*** Test Cases ***
Validate "Gateway 20 Child" vocabulary
    Create new configuration of ChatEditor
    Select Touch Chat
    Select English
    Select Symbol Set: SymbolStix with Gateway aditional vocabulary
    Create English user
    Maximize the window
    Reach Library of vocabs
    Select vocabulary    name:English    name:SymbolStix    name:Gateway    ${gateway20Child}

Assertions for "Gateway 20 Child" vocabulary
    # Click on a button's text - Gateway 20 Child
    Set Resolution    ${window}    1800    800
    ${text}    Set Variable    I
    Click On Button With Text    ${text}    TouchChat\\TouchChatEnglish\\gateway20Child\\i.png    0.6
    ${message}=    RPA.Windows.Get Value    id:1000
    Should Contain    ${message}    I

    Check to see if the user exist

    # Check to see if the name of the vocabulary is included in the text box - Gateway 20 Child
    RPA.Windows.Click    ${edit_mode_btn}
    ${message}=    RPA.Windows.Get Text    id:65535
    Should Contain    ${message}    The vocabulary "Gateway 20 Child"
    RPA.Windows.Click    id:7

    # Check to see if the vocabulary 'name' attribute is its actual name - Gateway 20 Child
    RPA.Desktop.Press Keys    alt    l
    RPA.Windows.Click    name:English
    RPA.Windows.Click    name:SymbolStix
    RPA.Windows.Click    name:Gateway
    ${name}=    RPA.Windows.Get Attribute    name:"Gateway 20 Child (Current)"    Name
    Should Be Equal    ${name}    Gateway 20 Child (Current)
