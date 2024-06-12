*** Settings ***
Documentation       Check "WordPower108 PCS" ENGLISH vocabulary
Resource            ../../../../../../Resources/resources.robot
Resource            ../../../../../../Resources/vocabularyAssertions.robot

Suite Setup         Run Keywords    Delete Chat Editor Folder    AND    Open ChatEditor
Suite Teardown      Close ChatEditor

*** Test Cases ***
Validate "WordPower108 PCS" vocabulary
    Create new configuration of ChatEditor
    Select Nova Chat
    Select English
    Select Symbol Set: SymbolStix&PCS without aditional vocabularies    True
    Create english user
    Maximize the window
    Reach Library of vocabs
    Select vocabulary    name:English    name:PCS    name:WordPower     ${page_down_button}    ${wordPower108PCS}

Assertions for "WordPower108 PCS" ENGLISH vocabulary
    # Click on a button's text - WordPower108 PCS
    Set Resolution    ${window}    1800    800
    ${text}    Set Variable    QUESTN
    Click On Button With Text    ${text}    NovaChatChatFusion\\NovaChatChatFusionEnglish\\wordPower108PCS\\questn.png    0.6

    Check to see if the user exist

    # Check to see if the dictionary's name is included in the text box - WordPower108 PCS
    RPA.Windows.Click    ${edit_mode_btn}
    ${message}=    RPA.Windows.Get Text    id:65535
    Should Contain    ${message}    The vocabulary "WordPower108 PCS"
    RPA.Windows.Click    id:7

    # Check to see if the dictionary's 'name' attribute is its actual name - WordPower108 PCS
    RPA.Desktop.Press Keys    alt    l
    RPA.Windows.Click    name:English
    RPA.Windows.Click    name:PCS
    RPA.Windows.Click    name:WordPower
    ${name}=    RPA.Windows.Get Attribute    name:"WordPower108 PCS (Current)"    Name
    Should Be Equal    ${name}    WordPower108 PCS (Current)
