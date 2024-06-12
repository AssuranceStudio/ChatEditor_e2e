# chatEditor_e2e
# Table of Contents

[Prerequisites – Software needed 2](#_toc164681923)

[Git\* 2](#_toc164681924)

[Python and its libraries 2](#_toc164681925)

[Python 2](#_toc164681926)

[Python Libraries 2](#_toc164681927)

[Visual Studio Code\* 3](#_toc164681928)

[Robot Framework and its libraries 3](#_toc164681929)

[Robot Framework 3](#_toc164681930)

[Robot Framework Libraries 4](#_toc164681931)

[ChatEditor 4](#_toc164681932)

[How to get the robot files 4](#_toc164681933)

[Getting the code from GitHub – private repository 4](#_toc164681934)

[Running the tests and interpreting the results 4](#_toc164681935)

[Opening the results 5](#_toc164681936)

[Change Summary 6](#_toc164681937)

[Final Notes 6](#_toc164681938)

## <a name="_toc164681923"></a>Prerequisites – Software needed

1.  - **Git\***
1.  - **Python**
1.  - **Python Library: PyAutoGUI**
1.  - **Python Library: PyGetWindow**
1.  - **Python Library: OpenCV**
1.  - **Python Library: PyTesseract**
1.  - **Visual Studio Code\***
1.  - **Robot Framework**
1.  - **Python Library: robotframework**
1.  - **Python Library: rpaframework[windows]**

The software list is recommended for running the e2e suite. The ones marked with \* are not mandatory, but for making the process easier, they are nice to have.

1.  - Without **Git** we would be unable to get the latest code from the server. A workaround for this is in place.
1.  - Without **Visual Studio Code** we won’t be able to read the code in an understandable way, besides that it has integrated a Terminal (CMD).

## <a name="_toc164681924"></a>Git\*

1.  1. Download git from <https://git-scm.com/download/win> (64bit)
1.  1. Open the installer (leave all the option as they are in the installer)
1.  1. Next à Next à Next à Next à Next à Next à Next à Next à Next à Next à Next à Next à Next à Next à Next à **Install**
1.  1. Check _Launch Git_
1.  1. Uncheck _View Release Notes_
1.  1. Press **Finish**

Git should be installed now. The git terminal should open at the end.

## <a name="_toc164681925"></a>Python and its libraries

### <a name="_toc164681926"></a>Python

1.  1. Download Python from <https://www.python.org/downloads/>
1.  1. Press on “Download Python” button
1.  1. Open the installer
1.  1. Check _Add python.exe to PATH_ à\* Install Now à Close

Python should be installed. We can check this by open a CMD window and type python --version, the result should be the version that we installed.

### <a name="_toc164681927"></a>Python Libraries

1.  1. Open a CMD window;
1.  1. Install PyAutoGUI library:

    PyAutoGUI is a Python library that allows users to automate interactions with the Graphical User Interface. It enables remote control of the mouse and keyboard using Python code, which is useful for automating repetitive tasks or interactions with desktop applications.

1.  1. Type pip install pyautogui
1.  1. Press Enter;
1.  1. The library should be installed;
1.  1. Install PyGetWindow library:

    PyGetWindow is a Python library that allows users to access and interact with windows on their desktop. It provides functions to retrieve information about open windows, such as titles, dimensions, positions, etc., and to control interactions with these windows.

1.  1. Type pip install pygetwindow
1.  1. Press Enter;
1.  1. The library should be installed;
1.  1. Install OpenCV library:

    OpenCV is an open-source library specialized in image and video processing. It offers functions and algorithms to perform various image processing operations, including object recognition, face detection, image segmentation, camera calibration, and many others.

1.  1. Type pip install opencv-python
1.  1. Press Enter;
1.  1. The library should be installed;
1.  1. Install PyTesseract library:

    PyTesseract is a Python library that provides a simple interface for using the Tesseract Optical Character Recognition (OCR) engine. In other words, it allows users to extract text from images or documents.

1.  1. Type pip install pytesseract
1.  1. Press Enter;
1.  1. The library should be installed;

## <a name="_toc164681928"></a>Visual Studio Code\*

1.  1. Download Visual Studio Code from <https://code.visualstudio.com/download> (64bit)
1.  1. Open the installer
1.  1. Accept the agreement à Next à Next à Next à _Check “Add Open with Code” options_ à Next à **Install**
1.  1. Press **Finish**

Visual Studio Code should be installed. We can check this by opening it.

## <a name="_hlk161831398"></a><a name="_toc164681929"></a>Robot Framework and its libraries

### <a name="_toc164681930"></a>Robot Framework

Description:

-   Robot Framework is a generic open-source automation framework for acceptance testing, acceptance test-driven development (ATDD), and robotic process automation (RPA).
-   It utilizes a simple, keyword-driven syntax that allows both technical and non-technical users to write test cases in a readable and understandable format.
-   Robot Framework supports a wide range of libraries and extensions for testing web applications, APIs, databases, desktop applications, and more.
-   It provides built-in reporting and logging capabilities, making it easy to track test execution results and debug test cases.
-   With its extensibility and flexibility, Robot Framework is widely used in agile and continuous integration/continuous deployment (CI/CD) environments for automating software testing and validation processes.

Using pip, which is the package manager for Python, install Robot Framework:

1.  1. Open a CMD window;
1.  1. Type pip install robotframework
1.  1. Press Enter;

Robot Framework should be installed. We can check this by open a CMD window and type robot --version, the result should be the version that we installed.

### <a name="_toc164681931"></a>Robot Framework Libraries

Using pip, which is the package manager for Python, install RPA.Windows and RPA.Desktop libraries:

1.  1. Open a CMD window;
1.  1. Type pip install rpaframework[windows]
1.  1. Press Enter;

RPA.Windows and RPA.Desktop libraries should be installed. We can check this by open a CMD window and type pip list, which will generate a list of all installed Python packages and we can search in this list to see if the RPA.Windows and RPA.Desktop libraries are present.

## <a name="_toc164681932"></a>ChatEditor

For installing or uninstalling ChatEditor please consult the appropriate Work Instruction.

## <a name="_toc129013818"></a><a name="_toc164681933"></a>How to get the robot files

`	`A robot file is a set of instructions that contain the code (steps) that the framework should follow in order to execute the tests.

`	`There are two ways, and in this WI, both will be detailed. In case that you do not have git credentials, please follow the first one, but if you do have git credentials jump to the second portion of this chapter.

## <a name="_toc129013820"></a><a name="_toc164681934"></a>Getting the code from GitHub – private repository

1. Open in Visual Studio Code (Right click > open with Code) C:\git
1. In the **Terminal** write git clone <git@github.com:TheGreeMug/chatEditor_e2e.git>
1. Now the code should be downloaded from git server, when it is done;
1. Please see the section[ (Running and Interpreting the results)](#_running_the_tests)
1. In order to start the run of the tests you should
    1. In a new terminal (Ctrl+Shift+`) run robot .\Tests
1. The tests should be running.

## <a name="_running_the_tests"></a><a name="_toc164681935"></a>Running the tests and interpreting the results

Notes:

`	`After all the steps in the previous two chapters have been done (getting the software and getting the code), we should be able now to run the tests:

1.  1. Open Visual Studio Code
1.  1. Select File à Open Folder
1.  1. Select the folder in which you unzipped the files or the folder in which the project was cloned (it should be) D:\git\e2e_chat_editor_robot
1.  1. Open a new Terminal window and run:
1.  1. For running all the tests it’s simply

<a name="_hlk164681488"></a>robot .\Tests

1.  1. For running specific tests, it should be: (in italic we have the examples)
    1.  1. If we want to run a single file (the path to the file should be provided)

robot .\PATH_TO_FILE.robot

robot .\Tests\Vocabulary\TouchChatEN\TouchChatEnglishSimbolstix\4BasicSS.robot

1.  1. If we want to run a single folder (path to folder)

`	`robot .\PATH_TO_FOLDER\

robot .\Tests\Vocabulary\TouchChatEN\TouchChatEnglishSimbolstix\

1.  1. If we want to run multiple files (path to files should be provided)

robot .\PATH_TO_FILE1.robot .\PATH_TO_FILE99.robot

1.  1. After running the tests, we will be having a result in the terminal window:

1.  1. But if we want a full look of the run tests, we have to check log.html and report.html files – Explained in this [section](#_opening_the_results).

## <a name="_opening_the_results"></a><a name="_toc164681936"></a>Opening the results

After running the tests, two files with the results will be generated, <a name="_hlk161925053"></a>**log.html** and **report.html:**

1.  1. The **log.html** file contains a detailed log of all events that occurred during the execution of tests. It provides information such as the start and end time of each test, along with any logging messages or error information that occurred during the test run.
1.  1. The **report.html** file presents a summarized and easily readable report, providing an overview of the test results. It includes information such as the total number of tests executed, the number of tests passed successfully, the number of failed tests, and any tests that were skipped.

The two files can be opened in a web browser window for viewing.

Notes:

1.  - After each run, we should be keeping track of the results that we get;
1.  - We can do that by renaming the files **log.html** and **report.html** to the name of what we ran;
1.  - If we run multiple times, without renaming the folder, it can be difficult to get the true results.

# <a name="_toc164681937"></a>**Change Summary**

| Date        | Pg. | Par. | Summary comments |    Author     |  Approver   |
| ----------- | --- | ---- | ---------------- | :-----------: | :---------: |
| ` `22-04-24 | 0   | 6    | Created the WI   | ` `Valentin B |    ` `MN    |
| ` `22-04-24 | -   | -    | Modified the WI  |  ` `Marius N  | ` `JH,ED,VB |
|             |     |      |                  |               |             |

# <a name="_toc164681938"></a>**Final Notes**

`	`Please take in consideration that this framework is not at its final stages, given this, changes might arise.
