*** Settings ***
Documentation       Check "Gateway Pro" ENGLISH vocabulary

Resource            ../../../../../Resources/resources.robot
Resource            ../../../../../Resources/vocabularyAssertions.robot

Suite Setup         Run Keywords    Delete Chat Editor Folder    AND    Open ChatEditor
Suite Teardown      Close ChatEditor


*** Test Cases ***
Validate "Gateway Pro" vocabulary
    Create new configuration of ChatEditor
    Select Touch Chat
    Select English
    Select Symbol Set: SymbolStix with Gateway aditional vocabulary
    Create English user
    Maximize the window
    Reach Library of vocabs
    Select vocabulary    name:English    name:SymbolStix    name:Gateway    ${page_down_button}    ${gatewayPro}

Assertions for "Gateway Pro" vocabulary
    # Check to see if there is a picture of the vocabulary icons - Gateway Pro
    Set Resolution    ${window}    1800    800
    ${text}    Set Variable    Questions
    Click On Button With Text    ${text}    TouchChat\\TouchChatEnglish\\gatewayPro\\questions.png    0.6

    Check to see if the user exist

    # Check to see if the name of the vocabulary is included in the text box - Gateway Pro
    RPA.Windows.Click    ${edit_mode_btn}
    ${message}=    RPA.Windows.Get Text    id:65535
    Should Contain    ${message}    The vocabulary "Gateway Pro"
    RPA.Windows.Click    id:7

    # Check to see if the vocabulary 'name' attribute is its actual name - Gateway Pro
    RPA.Desktop.Press Keys    alt    l
    RPA.Windows.Click    name:English
    RPA.Windows.Click    name:SymbolStix
    RPA.Windows.Click    name:Gateway
    ${name}=    RPA.Windows.Get Attribute    name:"Gateway Pro (Current)"    Name
    Should Be Equal    ${name}    Gateway Pro (Current)
