*** Settings ***
Documentation       Check "Intermediate Scan SS" ENGLISH vocabulary
Resource            ../../../../../Resources/resources.robot
Resource            ../../../../../Resources/vocabularyAssertions.robot

Suite Setup         Run Keywords    Delete Chat Editor Folder    AND    Open ChatEditor
Suite Teardown      Close ChatEditor

*** Test Cases ***
Validate "Intermediate Scan SS" vocabulary
    Create new configuration of ChatEditor
    Select Nova Chat
    Select English
    Select Symbol Set: SymbolStix
    Create english user
    Maximize the window
    Reach Library of vocabs
    Select vocabulary    name:English    name:SymbolStix     ${intermediateScanSS}

Assertions for "Intermediate Scan SS" ENGLISH vocabulary
    # Click on a button's text - Intermediate Scan SS
    Set Resolution    ${window}    1800    800
    ${text}    Set Variable    talk
    Click On Button With Text    ${text}    NovaChatChatFusion\\NovaChatChatFusionEnglish\\intermediateScanSS\\want.png    0.6

    Check to see if the user exist

    # Check to see if the dictionary's name is included in the text box - Intermediate Scan SS
    RPA.Windows.Click    ${edit_mode_btn}
    ${message}=    RPA.Windows.Get Text    id:65535
    Should Contain    ${message}    The vocabulary "Intermediate Scan SS"
    RPA.Windows.Click    id:7

    # Check to see if the dictionary's 'name' attribute is its actual name - Intermediate Scan SS
    RPA.Desktop.Press Keys    alt    l
    RPA.Windows.Click    name:English
    RPA.Windows.Click    name:SymbolStix
    ${name}=    RPA.Windows.Get Attribute    name:"Intermediate Scan SS (Current)"    Name
    Should Be Equal    ${name}    Intermediate Scan SS (Current)
