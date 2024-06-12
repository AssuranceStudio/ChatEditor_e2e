*** Settings ***
Documentation       Check "Engage for iOS PCS" ENGLISH vocabulary

Resource            ../../../../../Resources/resources.robot
Resource            ../../../../../Resources/vocabularyAssertions.robot

Suite Setup         Run Keywords    Delete Chat Editor Folder    AND    Open ChatEditor
Suite Teardown      Close ChatEditor


*** Test Cases ***
Validate "Engage for iOS PCS" vocabulary
    Create new configuration of ChatEditor
    Select Touch Chat
    Select English
    Select Symbol Set: SymbolStix&PCS without aditional vocabularies
    Create English user
    Maximize the window
    Reach Library of vocabs
    Select vocabulary    name:English    name:PCS     ${engageForiOSPCS}

Assertions for "Engage for iOS PCS" vocabulary
    # Click on a button's text - Engage for iOS PCS
    Set Resolution    ${window}    1800    800
    ${text}    Set Variable    PRACTICE
    Click On Button With Text    ${text}    TouchChat\\TouchChatEnglish\\engageForIOSPCS\\practice.png    0.6

    Check to see if the user exist

    # Check to see if the name of the vocabulary is included in the text box - Engage for iOS PCS
    RPA.Windows.Click    ${edit_mode_btn}
    ${message}=    RPA.Windows.Get Text    id:65535
    Should Contain    ${message}    The vocabulary "Engage for iOS PCS"
    RPA.Windows.Click    id:7

    # Check to see if the vocabulary 'name' attribute is its actual name - Engage for iOS PCS
    RPA.Desktop.Press Keys    alt    l
    RPA.Windows.Click    name:English
    RPA.Windows.Click    name:PCS
    ${name}=    RPA.Windows.Get Attribute    name:"Engage for iOS PCS (Current)"    Name
    Should Be Equal    ${name}    Engage for iOS PCS (Current)
