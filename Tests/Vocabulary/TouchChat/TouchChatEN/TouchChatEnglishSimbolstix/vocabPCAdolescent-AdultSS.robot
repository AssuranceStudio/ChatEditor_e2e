*** Settings ***
Documentation       Check "VocabPC Adolescent-Adult SS" ENGLISH vocabulary

Resource            ../../../../../Resources/resources.robot
Resource            ../../../../../Resources/vocabularyAssertions.robot

Suite Setup         Run Keywords    Delete Chat Editor Folder    AND    Open ChatEditor
Suite Teardown      Close ChatEditor


*** Test Cases ***
Validate "VocabPC Adolescent-Adult SS" vocabulary
    Create new configuration of ChatEditor
    Select Touch Chat
    Select English
    Select Symbol Set: SymbolStix without aditional vocabularies
    Create English user
    Maximize the window
    Reach Library of vocabs
    Select vocabulary    name:English    name:SymbolStix    ${page_down_button}    ${vocabPCAdolescent-AdultSS}

Assertions for "VocabPC Adolescent-Adult SS" vocabulary
    # Click on a button's text - VocabPC Adolescent-Adult SS
    Set Resolution    ${window}    1800    800
    ${text}    Set Variable    don't want
    Click On Button With Text    ${text}    TouchChat\\TouchChatEnglish\\vocabPCAdolescent-AdultSS\\don'tWant.png    0.6
    ${message}=    RPA.Windows.Get Value    id:1000
    Should Contain    ${message}    I don't want

    Check to see if the user exist

    # Check to see if the name of the vocabulary is included in the text box - VocabPC Adolescent-Adult SS
    RPA.Windows.Click    ${edit_mode_btn}
    ${message}=    RPA.Windows.Get Text    id:65535
    Should Contain    ${message}    The vocabulary "VocabPC Adolescent-Adult SS"
    RPA.Windows.Click    id:7

    # Check to see if the vocabulary 'name' attribute is its actual name - VocabPC Adolescent-Adult SS
    RPA.Desktop.Press Keys    alt    l
    RPA.Windows.Click    name:English
    RPA.Windows.Click    name:SymbolStix
    ${name}=    RPA.Windows.Get Attribute    name:"VocabPC Adolescent-Adult SS (Current)"    Name
    Should Be Equal    ${name}    VocabPC Adolescent-Adult SS (Current)
