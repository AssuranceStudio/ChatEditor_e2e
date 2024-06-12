*** Settings ***
Library     RPA.Windows
Library     OperatingSystem
Library     RPA.Desktop
Library     String
Library     AutoItLibrary
Library     screen_resolution.py
Library     pytesseract
Library     pyautogui
Library    RPA.JavaAccessBridge


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

# Nova Chat product
${NovaChat/ChatFusion}             name:"Nova Chat/Chat Fusion"
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
${engageForiOSSS}                                name:"Engage for iOS SS"
${multiChat15AdolescentSS}                       name:"MultiChat 15 Adolescent SS"
${multiChat15AdultSS}                            name:"MultiChat 15 Adult SS"
${multiChat15StudentSS}                          name:"MultiChat 15 Student SS"
${myCoreSS}                                      name:"myCore SS"
${myQuickChat4ChildSS}                           name:"myQuickChat 4 Child SS"
${myQuickChat8AdultSS}                           name:"myQuickChat 8 Adult SS"
${myQuickChat8ChildSS}                           name:"myQuickChat 8 Child SS"
${myQuickChat12AdultSS}                          name:"myQuickChat 12 Adult SS"
${myQuickChat12ChildSS}                          name:"myQuickChat 12 Child SS"
${sinSintaxis4x4EnglishSS}                       name:"sin sintaxis 4x4 English SS"
${sintaxis4x5EnglishSS}                          name:"sintaxis 4x5 English SS"
${spellingSS}                                    name:"Spelling SS"
${vocabPCAdolescent-AdultSS}                     name:"VocabPC Adolescent-Adult SS"
${4BasicPCS}                                     name:"4-Basic PCS"
${communicationJourneyAphasiaPCS}                name:"Communication Journey Aphasia PCS"
${communicationJourneyAphasiaUKPCS}              name:"Communication Journey Aphasia UK PCS"
${engageForiOSPCS}                               name:"Engage for iOS PCS"
${multiChat15AdolescentPCS}                      name:"MultiChat 15 Adolescent PCS"
${multiChat15AdultPCS}                           name:"MultiChat 15 Adult PCS"
${multiChat15StudentPCS}                         name:"MultiChat 15 Student PCS"
${myCorePCS}                                     name:"myCore PCS"
${myQuickChat4ChildPCS}                          name:"myQuickChat 4 Child PCS"
${myQuickChat8AdultPCS}                          name:"myQuickChat 8 Adult PCS"
${myQuickChat8ChildPCS}                          name:"myQuickChat 8 Child PCS"
${myQuickChat12AdultPCS}                         name:"myQuickChat 12 Adult PCS"
${myQuickChat12ChildPCS}                         name:"myQuickChat 12 Child PCS"
${sinSintaxis4x4EnglishPCS}                      name:"sin sintaxis 4x4 English PCS"
${sintaxis4x5EnglishPCS}                         name:"sintaxis 4x5 English PCS"
${spellingPCS}                                   name:"Spelling PCS"
${vocabPCAdolescent-AdultPCS}                    name:"VocabPC Adolescent-Adult PCS"
${wordPower20SimplySS}                           name:"WordPower20 Simply SS"
${wordPower25Touch&ScanSS}                       name:"WordPower25 Touch & Scan SS"
${wordPower42BasicSS}                            name:"WordPower42 Basic SS"
${wordPower42SS}                                 name:"WordPower42 SS"
${wordPower48SS}                                 name:"WordPower48 SS"
${wordPower60SS}                                 name:"WordPower60 SS"
${wordPower80SS}                                 name:"WordPower80 SS"
${wordPower108SS}                                name:"WordPower108 SS"
${wordPower108wKeyboardSS}                       name:"WordPower108 w Keyboard SS"
${wordPower140Scan&TouchSS}                      name:"WordPower140 Scan & Touch SS"
${talkAbout}                                     name:"Talk-About"
${gateway12Child}                                name:"Gateway 12 Child"
${gateway20Child}                                name:"Gateway 20 Child"
${gateway20Teen}                                 name:"Gateway 20 Teen"
${gateway30Teen}                                 name:"Gateway 30 Teen"
${gateway40Child}                                name:"Gateway 40 Child"
${gateway40Teen}                                 name:"Gateway 40 Teen"
${gateway40Text}                                 name:"Gateway 40 Text"
${gateway66Child}                                name:"Gateway 66 Child"
${gateway66Teen}                                 name:"Gateway 66 Teen"
${gateway66Text}                                 name:"Gateway 66 Text"
${gatewayPro}                                    name:"Gateway Pro"

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
Select Nova Chat
    RPA.Windows.Click    ${productDropbox}
    RPA.Windows.Click    ${NovaChat/ChatFusion}
    RPA.Windows.Click    id:1592

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

Select Symbol Set: SymbolStix&PCS without aditional vocabularies
    RPA.Windows.Click    ${symbolSetDropbox}
    RPA.Windows.Click    ${symbolStix&PCS}
    RPA.Windows.Click    id:1592
    RPA.Windows.Click    id:1592

Select Symbol Set: SymbolStix&Pixon
    RPA.Windows.Click    ${symbolSetDropbox}
    RPA.Windows.Click    ${symbolStix&Pixon}
    RPA.Windows.Click    id:1592
    RPA.Windows.Click    name:Pixon
    RPA.Desktop.Press Keys    space
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

Select Symbol Set: SymbolStix with Gateway aditional vocabulary
    RPA.Windows.Click    ${symbolSetDropbox}
    RPA.Windows.Click    ${symbolStix}
    RPA.Windows.Click    id:1592
    RPA.Windows.Click    name:Gateway
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

Create new vocabulary
    RPA.Desktop.Press Keys    alt
    RPA.Desktop.Press Keys    enter
    RPA.Windows.Click    ${ok_btn_id1}

Create a new vocabulary file
    Send Keys    id:1034    new_vocab_file_name
    RPA.Desktop.Press Keys    alt
    RPA.Desktop.Press Keys    enter
    RPA.Windows.Click    id:2
    Send Keys    id:1034    page1
    RPA.Desktop.Press Keys    alt
    RPA.Desktop.Press Keys    enter
    RPA.Windows.Click    name:Close

# Customize the new button and select it
#     Send Keys    id:1035    New button
#     RPA.Windows.Click    id:1036
#     Type With Modifiers    a    CTRL
#     Press Special Key    DELETE
#     Send Keys    id:1036    Hello
#     RPA.Windows.Click    id:1164
#     SikuliLibrary.Wait Until Screen Contain    search_&_find_images.png    timeout=3
#     RPA.Windows.Click    name:"button (SymbolStix)"
#     RPA.Windows.Click    id:1166
#     RPA.Windows.Click    name:Style
#     RPA.Windows.Click    id:1014
#     RPA.Windows.Click    name:Amaranth
#     RPA.Windows.Click    id:1010
#     RPA.Windows.Click    name:"24 pts"
#     RPA.Windows.Click    id:1044
#     RPA.Windows.Click    id:1045
#     SikuliLibrary.Click    ${red}
#     RPA.Windows.Click    ${ok_btn_id1}
#     RPA.Windows.Click    id:1046
#     SikuliLibrary.Click    ${blue}
#     RPA.Windows.Click    ${ok_btn_id1}
#     RPA.Windows.Click    id:1048
#     SikuliLibrary.Click    ${black}
#     RPA.Windows.Click    ${ok_btn_id1}
#     RPA.Windows.Click    id:1056
#     RPA.Windows.Click    name:5
#     SikuliLibrary.Click    ${add_btn}
#     SikuliLibrary.Click    new_btn_added.png

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

# TouchChatEnglishSimbolstix&PCS
Select TouchChatEnglishSimbolstix&PCS vocabularies
    [Arguments]    ${vocabName}    ${downPageButton}=NONE
    RPA.Windows.Click    name:English
    RPA.Windows.Click    name:PCS
    Run Keyword If    '${downPageButton}' != 'NONE'    RPA.Windows.Click    ${downPageButton}
    RPA.Windows.Click    ${vocab_name}
    RPA.Windows.Click    id:33674

# TouchChatEnglishSimbolstix&Pixon
Select "Pixon" vocabulary
    RPA.Windows.Click    name:English
    RPA.Windows.Click    name:Pixon
    RPA.Desktop.Press Keys    down
    # ${elemente}    Get Elements    name:Pixon
    # ${element_level_3}=    Get Elements    name:Pixon    level:3
    # Log    ${elemente}
    RPA.Windows.Click    id:33674
    RPA.Windows.Click    name:English

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

# TouchChatEnglishSimbolstix&Gateway
Select TouchChatEnglishSimbolstix&Gateway vocabularies
    [Arguments]    ${vocabName}    ${downPageButton}=NONE
    RPA.Windows.Click    name:English
    RPA.Windows.Click    name:SymbolStix
    RPA.Windows.Click    name:Gateway
    Run Keyword If    '${downPageButton}' != 'NONE'    RPA.Windows.Click    ${downPageButton}
    RPA.Windows.Click    ${vocab_name}
    RPA.Windows.Click    id:33674
