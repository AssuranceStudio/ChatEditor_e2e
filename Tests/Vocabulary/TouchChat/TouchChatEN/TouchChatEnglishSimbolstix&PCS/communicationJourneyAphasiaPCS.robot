*** Settings ***
Documentation       Check "Communication Journey Aphasia PCS" ENGLISH vocabulary

Resource            ../../../../../Resources/resources.robot
Resource            ../../../../../Resources/vocabularyAssertions.robot

Suite Setup         Run Keywords    Delete Chat Editor Folder    AND    Open ChatEditor
Suite Teardown      Run Keywords    Close ChatEditor


*** Test Cases ***
Validate "Communication Journey Aphasia PCS" vocabulary
    Create new configuration of ChatEditor
    Select Touch Chat
    Select English
    Select Symbol Set: SymbolStix&PCS without aditional vocabularies
    Create English user
    Maximize the window
    Reach Library of vocabs
    Select vocabulary    name:English    name:PCS    ${communicationJourneyAphasiaPCS}

Assertions for "Communication Journey Aphasia PCS" vocabulary
    # Click on a button's text - Communication Journey Aphasia PCS
    Set Resolution    ${window}    1800    800
    ${text}    Set Variable    Things
    Click On Button With Text    ${text}    TouchChat\\TouchChatEnglish\\CommunicationJourneyAphasiaPCS\\things.png    0.6

    Check to see if the user exist

    # Check to see if the name of the vocabulary is included in the text box - Communication Journey Aphasia PCS
    RPA.Windows.Click    ${edit_mode_btn}
    ${message}=    RPA.Windows.Get Text    id:65535
    Should Contain    ${message}    The vocabulary "Communication Journey Aphasia PCS"
    RPA.Windows.Click    id:7

    # Check to see if the vocabulary 'name' attribute is its actual name - Communication Journey Aphasia PCS
    RPA.Desktop.Press Keys    alt    l
    RPA.Windows.Click    name:English
    RPA.Windows.Click    name:PCS
    ${name}=    RPA.Windows.Get Attribute    name:"Communication Journey Aphasia PCS (Current)"    Name
    Should Be Equal    ${name}    Communication Journey Aphasia PCS (Current)
