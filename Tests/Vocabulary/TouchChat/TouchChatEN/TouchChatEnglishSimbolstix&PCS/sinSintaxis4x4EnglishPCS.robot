*** Settings ***
Documentation       Check "sin sintaxis 4x4 English PCS" ENGLISH vocabulary

Resource            ../../../../../Resources/resources.robot
Resource            ../../../../../Resources/vocabularyAssertions.robot

Suite Setup         Run Keywords    Delete Chat Editor Folder    AND    Open ChatEditor
Suite Teardown      Close ChatEditor


*** Test Cases ***
Validate "sin sintaxis 4x4 English PCS" vocabulary
    Create new configuration of ChatEditor
    Select Touch Chat
    Select English
    Select Symbol Set: SymbolStix&PCS without aditional vocabularies
    Create English user
    Maximize the window
    Reach Library of vocabs
    Select TouchChatEnglishSimbolstix&PCS vocabularies    ${sinSintaxis4x4EnglishPCS}    ${page_down_button}

Assertions for "sin sintaxis 4x4 English PCS" vocabulary
    # Click on a button's text - sin sintaxis 4x4 English PCS
    Set Resolution    ${window}    1800    800
    ${text}=    Set Variable    Clothing
    Click On Button With Text    ${text}    sinSintaxis4x4EnglishPCS\\clothing.png    0.6

    Check to see if the user exist

    # Check to see if the name of the vocabulary is included in the text box - sin sintaxis 4x4 English PCS
    RPA.Windows.Click    ${edit_mode_btn}
    ${message}=    RPA.Windows.Get Text    id:65535
    Should Contain    ${message}    The vocabulary "sin sintaxis 4x4 English PCS"
    RPA.Windows.Click    id:7

    # Check to see if the vocabulary 'name' attribute is its actual name - sin sintaxis 4x4 English PCS
    RPA.Desktop.Press Keys    alt    l
    RPA.Windows.Click    name:English
    RPA.Windows.Click    name:PCS
    ${name}=    RPA.Windows.Get Attribute    name:"sin sintaxis 4x4 English PCS (Current)"    Name
    Should Be Equal    ${name}    sin sintaxis 4x4 English PCS (Current)
