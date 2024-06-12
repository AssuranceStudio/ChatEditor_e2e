import pyautogui
import pygetwindow as gw
import os
import logging

# Configure logging
logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')

def change_resolution(window_title, width, height):
    """
    Change the resolution of the specified window to the given dimensions.

    Arguments:
    window_title: The title of the window.
    width: The new width of the window.
    height: The new height of the window.
    """
    width = int(width)
    height = int(height)

    window = gw.getWindowsWithTitle(window_title)
    if window:
        window = window[0]
        window.resizeTo(width, height)
        window.moveTo((window.width - width) // 2, (window.height - height) // 2)
        logging.info(f"Changed resolution of '{window_title}' to {width}x{height}.")
    else:
        logging.error(f"The window with the title '{window_title}' was not found.")

def set_resolution(window_title, width, height):
    """
    Set the resolution of the specified window.

    Arguments:
    window_title: The title of the window.
    width: The new width of the window.
    height: The new height of the window.
    """
    change_resolution(window_title, width, height)

def click_on_button_with_text(text, image, conf):
    """
    Click on the button with the specified text by locating its image on the screen.

    Arguments:
    text: The text of the button (for logging purposes).
    image: The filename of the image to locate.
    conf: The confidence level for image recognition.
    """
    # Get the current working directory
    current_dir = os.path.dirname(os.path.abspath(__file__))

    # Construct the relative path to the image
    base_dir = os.path.abspath(os.path.join(current_dir, os.pardir))  # Go up one directory
    image_path = os.path.join(base_dir, 'images', 'vocabularies', image)

    # Log the image path
    logging.info(f"Image path: {image_path}")

    # Check if the image file exists
    if not os.path.exists(image_path):
        logging.error(f"The image file '{image}' does not exist at path '{image_path}'.")
        return

    try:
        # Find all positions on the screen where the specified text is located.
        button_positions = list(pyautogui.locateAllOnScreen(image_path, grayscale=True, confidence=conf))

        # Check if any positions were found.
        if button_positions:
            # Click on the first found position.
            pyautogui.click(button_positions[0])
            logging.info(f"I clicked on the button with the text '{text}'.")
        else:
            logging.warning(f"The button with the text '{text}' was not found on the screen.")
    except OSError as e:
        logging.error(f"Failed to read the image file: {e}")

# Example usage:
# set_resolution('Window Title', 1280, 720)
# click_on_button_with_text('example_text', 'TouchChat\\TouchChatEnglish\\4BasicSS\\iWant.png', 0.9)
