import pyautogui
from PIL import Image
import pygetwindow as gw


def change_resolution(window_title, width, height):
    width = int(width)
    height = int(height)
    """
    Change the resolution of the specified window to the given dimensions.

    Arguments:

    window_title: The title of the window.
    width: The new width of the window.
    height: The new height of the window.    """
    window = gw.getWindowsWithTitle(window_title)
    if window:
        window = window[0]
        window.resizeTo(width, height)
        window.moveTo((window.width - width) // 2, (window.height - height) // 2)
        print("xxx" + window_title)
    else:
        print("The window with the specified title was not found." + window_title)

# Define the keyword through which we change the screen resolution to the desired specifications
def set_resolution(window_title, width, height):
    change_resolution(window_title, width, height)

# Define the keyword used to click on the button with the specified text
def click_on_button_with_text(text, image, conf):
    image_path = 'E:\\Git\\e2e_chat_editor_robot\\images\\vocabularies\\TouchChat\\TouchChatEnglish\\' + image
    # Find all positions on the screen where the specified text is located.
    button_positions = list(pyautogui.locateAllOnScreen(image_path, grayscale=True, confidence=conf))

    # Iterate through each found position.
    for position in button_positions:
        # Click on each position
        pyautogui.click(position)
        print(f"I clicked on the button with the text '{text}'.")
        # Interrupt the iteration after the first click
        break
    else:
        print(f"The button with the text '{text}' was not found on the screen.")
