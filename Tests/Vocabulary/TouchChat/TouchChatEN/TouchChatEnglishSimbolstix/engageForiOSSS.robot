*** Settings ***
Documentation       Check "Engage for iOS SS" ENGLISH vocabulary

Resource            ../../../../../Resources/resources.robot
Resource            ../../../../../Resources/vocabularyAssertions.robot

Suite Setup         Run Keywords    Delete Chat Editor Folder    AND    Open ChatEditor
Suite Teardown      Close ChatEditor


*** Test Cases ***
Validate "Engage for iOS SS" vocabulary
    Create new configuration of ChatEditor
    Select Touch Chat
    Select English
    Select Symbol Set: SymbolStix without aditional vocabularies
    Create English user
    Maximize the window
    Reach Library of vocabs
    Select vocabulary    name:English    name:SymbolStix    ${engageForiOSSS}

Assertions for "Engage for iOS SS" vocabulary
    # Click on a button's text - Engage for iOS SS
    Set Resolution    ${window}    1800    800
    ${text}    Set Variable    PRACTICE
    Click On Button With Text    ${text}    TouchChat\\TouchChatEnglish\\engageForIOSSS\\practice.png    0.6

    Check to see if the user exist

    # Check to see if the name of the vocabulary is included in the text box - Engage for iOS SS
    RPA.Windows.Click    ${edit_mode_btn}
    ${message}=    RPA.Windows.Get Text    id:65535
    Should Contain    ${message}    The vocabulary "Engage for iOS SS"
    RPA.Windows.Click    id:7

    # Check to see if the vocabulary 'name' attribute is its actual name - Engage for iOS SS
    RPA.Desktop.Press Keys    alt    l
    RPA.Windows.Click    name:English
    RPA.Windows.Click    name:SymbolStix
    ${name}=    RPA.Windows.Get Attribute    name:"Engage for iOS SS (Current)"    Name
    Should Be Equal    ${name}    Engage for iOS SS (Current)
