*** Settings ***
Documentation       Check "myQuickChat 8 Child SS" ENGLISH vocabulary

Resource            ../../../../../Resources/resources.robot
Resource            ../../../../../Resources/vocabularyAssertions.robot

Suite Setup         Run Keywords    Delete Chat Editor Folder    AND    Open ChatEditor
Suite Teardown      Close ChatEditor


*** Test Cases ***
Validate "myQuickChat 8 Child SS" vocabulary
    Create new configuration of ChatEditor
    Select Touch Chat
    Select English
    Select Symbol Set: SymbolStix without aditional vocabularies
    Create English user
    Maximize the window
    Reach Library of vocabs
    Select vocabulary    name:English    name:SymbolStix    ${page_down_button}    ${myQuickChat8ChildSS}

Assertions for "myQuickChat 8 Child SS" vocabulary
    Check to see if the user exist

    # Check to see if the name of the vocabulary is included in the text box - myQuickChat 8 Child SS
    Set Resolution    ${window}    1800    800
    RPA.Windows.Click    ${edit_mode_btn}
    ${message}=    RPA.Windows.Get Text    id:65535
    Should Contain    ${message}    The vocabulary "myQuickChat 8 Child SS"
    RPA.Windows.Click    id:7

    # Check to see if the vocabulary 'name' attribute is its actual name - myQuickChat 8 Child SS
    RPA.Desktop.Press Keys    alt    l
    RPA.Windows.Click    name:English
    RPA.Windows.Click    name:SymbolStix
    ${name}=    RPA.Windows.Get Attribute    name:"myQuickChat 8 Child SS (Current)"    Name
    Should Be Equal    ${name}    myQuickChat 8 Child SS (Current)
