*** Settings ***
Documentation       Check "myQuickChat 12 Adult PCS" ENGLISH vocabulary

Resource            ../../../../../Resources/resources.robot
Resource            ../../../../../Resources/vocabularyAssertions.robot

Suite Setup         Run Keywords    Delete Chat Editor Folder    AND    Open ChatEditor
Suite Teardown      Close ChatEditor


*** Test Cases ***
Validate "myQuickChat 12 Adult PCS" vocabulary
    Create new configuration of ChatEditor
    Select Touch Chat
    Select English
    Select Symbol Set: SymbolStix&PCS without aditional vocabularies
    Create English user
    Maximize the window
    Reach Library of vocabs
    Select TouchChatEnglishSimbolstix&PCS vocabularies    ${myQuickChat12AdultPCS}    ${page_down_button}

Assertions for "myQuickChat 12 Adult PCS" vocabulary
    # Click on a button's text - myQuickChat 12 Adult PCS
    Set Resolution    ${window}    1800    800
    ${text}=    Set Variable    QuickChat 1
    Click On Button With Text    ${text}    myQuickChat12AdultPCS\\quickchat1.png    0.6

    Check to see if the user exist

    # Check to see if the name of the vocabulary is included in the text box - myQuickChat 12 Adult PCS
    RPA.Windows.Click    ${edit_mode_btn}
    ${message}=    RPA.Windows.Get Text    id:65535
    Should Contain    ${message}    The vocabulary "myQuickChat 12 Adult PCS"
    RPA.Windows.Click    id:7

    # Check to see if the vocabulary 'name' attribute is its actual name - myQuickChat 12 Adult PCS
    RPA.Desktop.Press Keys    alt    l
    RPA.Windows.Click    name:English
    RPA.Windows.Click    name:PCS
    ${name}=    RPA.Windows.Get Attribute    name:"myQuickChat 12 Adult PCS (Current)"    Name
    Should Be Equal    ${name}    myQuickChat 12 Adult PCS (Current)
