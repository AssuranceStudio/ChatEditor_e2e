*** Settings ***
Library     RPA.Windows
Library     OperatingSystem
Library     RPA.Desktop
Library     String
Library     AutoItLibrary
Library     screen_resolution.py
Library     pytesseract
Library     pyautogui


*** Variables ***
# ----------------------------------PATH-----------------------------------------------------
${chatEditorPath}       "C:/Program Files (x86)/Chat Editor/Chat Editor.exe"

# ----------------------------------BUTTONS-----------------------------------------------------
${ok_btn_id1}           id:1
${ok_btn_id2}           id:2
${myResources}          name:"My Resources"
${edit_mode_btn}        name:"Edit Mode"
${page_down_button}     id:DownPageButton

${productDropbox}       id:1585
${TouchChat}                       name:TouchChat


# Language Dropbox
${languageDropbox}      id:1587

# Language: English
${english}              name:English

# Symbol Set Dropbox
${symbolSetDropbox}     id:1586

# SymbolStix
${symbolStix}           name:SymbolStix

# SymbolStix&PCS
${symbolStix&PCS}           name:"SymbolStix & PCS"

# SymbolStix&Pixon
${symbolStix&Pixon}           name:"SymbolStix & Pixon"

# ----------------------------------VOCABULARIES-----------------------------------------------------
${4BasicSS}                                      name:"4-Basic SS (Current)"
${communicationJourneyAphasiaSS}                 name:"Communication Journey Aphasia SS"
${communicationJourneyAphasiaUKSS}               name:"Communication Journey Aphasia UK SS"
${wordPower20SimplySS}                           name:"WordPower20 Simply SS"
${talkAbout}                                     name:"Talk-About"

# ${window}            ChatEditor • EDIT MODE:  new_vocab_file_name – page1
${window}            ChatEditor • (EnglishUser)

*** Keywords ***
# ----------------------------------SETUP & TEARDOWN-----------------------------------------------------
Open ChatEditor
    Windows Run    ${chatEditorPath}

Close ChatEditor
    OperatingSystem.Run    taskkill /F /IM "Chat Editor.exe"

Delete Chat Editor Folder
    ${username}=    Get Environment Variable    USERNAME
    ${folderPath}=    Set Variable    C:\\Users\\${username}\\AppData\\Roaming\\Chat Editor
    OperatingSystem.Remove Directory    ${folderPath}    recursive=True
    # Copy Directory    D:\\Git\\e2e_chat_editor_robot\\Data\\Chat Editor  ${folderPath}
    Copy Directory    Data\\Chat Editor  ${folderPath}

# ----------------------------------PRODUCTS-----------------------------------------------------
Select Touch Chat
    RPA.Windows.Click    ${productDropbox}
    RPA.Windows.Click    ${TouchChat}
    RPA.Windows.Click    id:1592

# ----------------------------------LANGUAGES-----------------------------------------------------
Select English
    RPA.Windows.Click    ${languageDropbox}
    RPA.Windows.Click    ${english}
    RPA.Windows.Click    id:1592

Create new configuration of ChatEditor
    RPA.Windows.Click    id:1589
    RPA.Windows.Click    name:"Create New Configuration"
    RPA.Windows.Click    id:1591

# ----------------------------------SYMBOL SET(S)-----------------------------------------------------
#NOVACHAT
Select Symbol Set: SymbolStix
    RPA.Windows.Click    ${symbolSetDropbox}
    RPA.Windows.Click    ${symbolStix}
    RPA.Windows.Click    id:1592

#TOUCHCHAT
Select Symbol Set: SymbolStix without aditional vocabularies
    RPA.Windows.Click    ${symbolSetDropbox}
    RPA.Windows.Click    ${symbolStix}
    RPA.Windows.Click    id:1592
    RPA.Windows.Click    id:1592

Select Symbol Set: SymbolStix with WordPower aditional vocabulary
    RPA.Windows.Click    ${symbolSetDropbox}
    RPA.Windows.Click    ${symbolStix}
    RPA.Windows.Click    id:1592
    RPA.Windows.Click    name:WordPower
    RPA.Desktop.Press Keys    space
    RPA.Windows.Click    id:1592

Select Symbol Set: SymbolStix with Talk-About aditional vocabulary
    RPA.Windows.Click    ${symbolSetDropbox}
    RPA.Windows.Click    ${symbolStix}
    RPA.Windows.Click    id:1592
    RPA.Windows.Click    name:"Talk About"
    RPA.Desktop.Press Keys    space
    RPA.Windows.Click    id:1592

# ----------------------------------CREATE USERS-----------------------------------------------------
Create english user
    Send Keys    id:1034    EnglishUser
    RPA.Windows.Click    ${ok_btn_id1}

# ----------------------------------FEATURES-----------------------------------------------------
Reach Library of vocabs
    RPA.Desktop.Press Keys    alt
    RPA.Desktop.Press Keys    l

# ----------------------------------OTHERS-----------------------------------------------------
Maximize the window
    RPA.Desktop.Press Keys    alt    space
    RPA.Desktop.Press Keys    x

# ----------------------------------SELECT VOCABULARIES-----------------------------------------------------
# TouchChatEnglishSimbolstix
Select TouchChatEnglishSimbolstix vocabularies
    [Arguments]    ${vocabName}    ${downPageButton}=NONE
    RPA.Windows.Click    name:English
    RPA.Windows.Click    name:SymbolStix
    Run Keyword If    '${downPageButton}' != 'NONE'    RPA.Windows.Click    ${downPageButton}
    RPA.Windows.Click    ${vocab_name}
    RPA.Windows.Click    id:33674

# TouchChatEnglishSimbolstix&WordPower
Select TouchChatEnglishSimbolstix&WordPower vocabularies
    [Arguments]    ${vocabName}    ${downPageButton}=NONE
    RPA.Windows.Click    name:English
    RPA.Windows.Click    name:SymbolStix
    RPA.Windows.Click    name:WordPower
    Run Keyword If    '${downPageButton}' != 'NONE'    RPA.Windows.Click    ${downPageButton}
    RPA.Windows.Click    ${vocab_name}
    RPA.Windows.Click    id:33674

# TouchChatEnglishSimbolstix&TalkAbout
Select "Talk-About" vocabulary
    RPA.Windows.Click    name:English
    RPA.Windows.Click    name:SymbolStix
    RPA.Windows.Click    id:DownPageButton
    RPA.Windows.Click    ${talkAbout}
    RPA.Windows.Click    id:33674
