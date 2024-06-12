*** Settings ***
Documentation       Check "VocabPC Adolescent-Adult PCS" ENGLISH vocabulary

Resource            ../../../../../Resources/resources.robot
Resource            ../../../../../Resources/vocabularyAssertions.robot

Suite Setup         Run Keywords    Delete Chat Editor Folder    AND    Open ChatEditor
Suite Teardown      Close ChatEditor


*** Test Cases ***
Validate "VocabPC Adolescent-Adult PCS" vocabulary
    Create new configuration of ChatEditor
    Select Touch Chat
    Select English
    Select Symbol Set: SymbolStix&PCS without aditional vocabularies
    Create English user
    Maximize the window
    Reach Library of vocabs
    Select vocabulary    name:English    name:PCS    ${page_down_button}    ${vocabPCAdolescent-AdultPCS}

Assertions for "VocabPC Adolescent-Adult PCS" vocabulary
    # Click on a button's text - VocabPC Adolescent-Adult PCS
    Set Resolution    ${window}    1800    800
    ${text}    Set Variable    I want
    Click On Button With Text    ${text}    TouchChat\\TouchChatEnglish\\vocabPCAdolescent-AdultPCS\\iWant.png    0.6
    ${message}=    RPA.Windows.Get Value    id:1000
    Should Contain    ${message}    I want

    Check to see if the user exist

    # Check to see if the name of the vocabulary is included in the text box - VocabPC Adolescent-Adult PCS
    RPA.Windows.Click    ${edit_mode_btn}
    ${message}=    RPA.Windows.Get Text    id:65535
    Should Contain    ${message}    The vocabulary "VocabPC Adolescent-Adult PCS"
    RPA.Windows.Click    id:7

    # Check to see if the vocabulary 'name' attribute is its actual name - VocabPC Adolescent-Adult PCS
    RPA.Desktop.Press Keys    alt    l
    RPA.Windows.Click    name:English
    RPA.Windows.Click    name:PCS
    ${name}=    RPA.Windows.Get Attribute    name:"VocabPC Adolescent-Adult PCS (Current)"    Name
    Should Be Equal    ${name}    VocabPC Adolescent-Adult PCS (Current)
