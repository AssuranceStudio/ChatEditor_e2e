*** Settings ***
Documentation       Check "WordPower140 Scan & Touch SS" ENGLISH vocabulary

Resource            ../../../../../Resources/resources.robot
Resource            ../../../../../Resources/vocabularyAssertions.robot

Suite Setup         Run Keywords    Delete Chat Editor Folder    AND    Open ChatEditor
Suite Teardown      Close ChatEditor


*** Test Cases ***
Validate "WordPower140 Scan & Touch SS" vocabulary
    Create new configuration of ChatEditor
    Select Touch Chat
    Select English
    Select Symbol Set: SymbolStix with WordPower aditional vocabulary
    Create English user
    Maximize the window
    Reach Library of vocabs
    Select vocabulary    name:English    name:SymbolStix    name:WordPower    ${page_down_button}    ${wordPower140Scan&TouchSS}

Assertions for "WordPower140 Scan & Touch SS" vocabulary
    # Click on a button's text - WordPower140 Scan & Touch SS
    Set Resolution    ${window}    1800    800
    ${text}    Set Variable    I
    Click On Button With Text    ${text}    TouchChat\\TouchChatEnglish\\wordPower140Scan&TouchSS\\i.png    0.6
    ${message}=    RPA.Windows.Get Value    id:1000
    Should Contain    ${message}    I

    Check to see if the user exist

    # Check to see if the name of the vocabulary is included in the text box - WordPower140 Scan & Touch SS
    RPA.Windows.Click    ${edit_mode_btn}
    ${message}=    RPA.Windows.Get Text    id:65535
    Should Contain    ${message}    The vocabulary "WordPower140 Scan & Touch SS"
    RPA.Windows.Click    id:7

    # Check to see if the vocabulary 'name' attribute is its actual name - WordPower140 Scan & Touch SS
    RPA.Desktop.Press Keys    alt    l
    RPA.Windows.Click    name:English
    RPA.Windows.Click    name:SymbolStix
    RPA.Windows.Click    name:WordPower
    ${name}=    RPA.Windows.Get Attribute    name:"WordPower140 Scan & Touch SS (Current)"    Name
    Should Be Equal    ${name}    WordPower140 Scan & Touch SS (Current)
