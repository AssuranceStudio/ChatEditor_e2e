*** Settings ***
Documentation       Check "sintaxis 4x5 English PCS" ENGLISH vocabulary

Resource            ../../../../../Resources/resources.robot
Resource            ../../../../../Resources/vocabularyAssertions.robot

Suite Setup         Run Keywords    Delete Chat Editor Folder    AND    Open ChatEditor
Suite Teardown      Close ChatEditor


*** Test Cases ***
Validate "sintaxis 4x5 English PCS" vocabulary
    Create new configuration of ChatEditor
    Select Touch Chat
    Select English
    Select Symbol Set: SymbolStix&PCS without aditional vocabularies
    Create English user
    Maximize the window
    Reach Library of vocabs
    Select vocabulary    name:English    name:PCS    ${page_down_button}    ${sintaxis4x5EnglishPCS}

Assertions for "sintaxis 4x5 English PCS" vocabulary
    # Click on a button's text - sintaxis 4x5 English PCS
    Set Resolution    ${window}    1800    800
    ${text}    Set Variable    Places
    Click On Button With Text    ${text}    TouchChat\\TouchChatEnglish\\sintaxis4x5EnglishPCS\\places.png    0.6

    Check to see if the user exist

    # Check to see if the name of the vocabulary is included in the text box - sintaxis 4x5 English PCS
    RPA.Windows.Click    ${edit_mode_btn}
    ${message}=    RPA.Windows.Get Text    id:65535
    Should Contain    ${message}    The vocabulary "sintaxis 4x5 English PCS"
    RPA.Windows.Click    id:7

    # Check to see if the vocabulary 'name' attribute is its actual name - sintaxis 4x5 English PCS
    RPA.Desktop.Press Keys    alt    l
    RPA.Windows.Click    name:English
    RPA.Windows.Click    name:PCS
    ${name}=    RPA.Windows.Get Attribute    name:"sintaxis 4x5 English PCS (Current)"    Name
    Should Be Equal    ${name}    sintaxis 4x5 English PCS (Current)
