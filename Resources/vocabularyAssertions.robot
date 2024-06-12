*** Settings ***
Resource    ../Resources/resources.robot
Library     RPA.Windows
Library     OperatingSystem
Library     RPA.Desktop
Library     screen_resolution.py
Library     RPA.SAP
Library     pytesseract
Library     pyautogui


*** Keywords ***
Check to see if the user exist
    ${text}=    RPA.Windows.Get Text    name:"ChatEditor • (EnglishUser)"
    Should Be Equal    ${text}    ChatEditor • (EnglishUser)
