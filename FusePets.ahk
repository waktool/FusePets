#Requires AutoHotkey v2.0  ; Ensures the script runs only on AutoHotkey version 2.0, which supports the syntax and functions used in this script.

; ▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰
; FUSE PETS - AutoHotKey 2.0 Macro for Pet Simulator 99
; ▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰

; ▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰
; DIRECTIVES & CONFIGURATIONS
; ▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰

#SingleInstance Force  ; Forces the script to run only in a single instance. If this script is executed again, the new instance will replace the old one.
CoordMode "Mouse", "Client"  ; Sets the coordinate mode for mouse functions (like Click, MouseMove) to be relative to the active window's client area, ensuring consistent mouse positioning across different window states.
CoordMode "Pixel", "Client"  ; Sets the coordinate mode for pixel functions (like PixelSearch, PixelGetColor) to be relative to the active window's client area, improving accuracy in color detection and manipulation.
SetMouseDelay 10  ; Sets the delay between mouse events to 10 milliseconds, balancing speed and reliability of automated mouse actions.


; ▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰
; GLOBAL VARIABLES
; ▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰

; Titles and versioning for GUI elements.
MACRO_TITLE := "Fuse Quests"  ; The title displayed in main GUI elements.
MACRO_VERSION := "0.1.0"  ; Script version, helpful for user support and debugging.

; Mathematics and constants.
RADIUS := 150  ; Standard radius used for calculations in positioning or graphics.
PI := 3.1415926535897932384626433832795028841971693993751058209749445923078164062862089986280348253421170679  ; Mathematical constant Pi, crucial for circular calculations.

; User settings loaded from an INI file.
SETTINGS_INI := A_ScriptDir "\Settings.ini"  ; Path to settings INI file.


; ▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰
; MACRO
; ▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰

runMacro()

; ----------------------------------------------------------------------------------------
; runMacro Function
; Description: Executes the main macro sequence by performing initial setup tasks, displaying the main GUI, activating the Roblox window, and fusing pets.
; Operation:
;   - Completes all necessary initialization tasks to prepare the macro environment.
;   - Displays the main graphical user interface (GUI) for user interaction.
;   - Ensures the Roblox window is active and ready for input.
;   - Initiates the pet fusion process.
; Dependencies:
;   - completeInitialisationTasks: Performs initial setup tasks such as setting variables and preparing the environment.
;   - displayMainGui: Creates and displays the main GUI for user interaction and control.
;   - activateRoblox: Ensures the Roblox window is active and ready for input.
;   - fusePets: Initiates the pet fusion process in the game.
; Parameters: None
; Return: None
; ----------------------------------------------------------------------------------------
runMacro() {
    completeInitialisationTasks()  ; Perform all initial tasks necessary for the macro's setup, such as setting variables or preparing the environment.
    displayMainGui()  ; Creates and displays a graphical user interface that lists quests and other activities, enhancing user interaction and control.
    activateRoblox()  ; Ensures that the Roblox window is active and ready for input, critical for reliably sending commands to the game.    
    fusePets()  ; Initiates the pet fusion process in the game.
}


; ▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰
; GUI INITIALISATION
; ▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰

; ----------------------------------------------------------------------------------------
; displayMainGui Function
; Description: Initializes and displays the main GUI with control buttons for various functions.
; Operation:
;   - Initializes the main GUI with "AlwaysOnTop" property.
;   - Sets the title of the GUI incorporating global variables for title and version.
;   - Sets the font of the GUI to "Segoe UI" for a modern look.
;   - Adds control buttons to the GUI for various functions such as Pause, Wiki, and Default Font.
;   - Displays the GUI window.
;   - Adjusts the GUI window position to the top right of the screen.
;   - Assigns events to buttons for respective functionalities.
; Dependencies:
;   - Gui: Function to create and manipulate GUI elements.
;   - AddButton: Function to add buttons to the GUI.
;   - Show: Function to display the GUI window.
;   - GetPos: Function to retrieve the GUI window position.
;   - Move: Function to move the GUI window to a specified position.
;   - OnEvent: Function to assign events to GUI elements.
; Parameters: None
; Return: None
; ----------------------------------------------------------------------------------------
displayMainGui() {
    ; Initialize the main GUI with "AlwaysOnTop" property.
    global guiMain := Gui("+AlwaysOnTop")
    guiMain.Title := MACRO_TITLE " v" MACRO_VERSION  ; Set the title incorporating global variables for title and version.
    guiMain.SetFont("s8", "Segoe UI")  ; Use "Segoe UI" font for a modern look.

    ; Add control buttons to the GUI for various functions.
    btnPause := guiMain.AddButton("Section", "⏸ &Pause")
    btnWiki := guiMain.AddButton("yp", "🌐 &Wiki")

    ; Display the GUI window.
    guiMain.Show("w300 h50")

    ; Retrieve and adjust the GUI window position to the top right of the screen.
    guiMain.GetPos(,, &Width,)
    guiMain.Move(A_ScreenWidth - Width + 8, 0)

    ; Assign events to buttons for respective functionalities.
    btnPause.OnEvent("Click", pauseMacro)
    btnWiki.OnEvent("Click", openWiki)
}


; ▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰
; GUI FUNCTIONS
; ▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰

; ----------------------------------------------------------------------------------------
; openWiki Function
; Description: Opens a help text file in Notepad for user assistance.
; Operation:
;   - Executes Notepad with a specified file path to display help documentation.
; Dependencies:
;   - Run: Function to execute external applications.
; Parameters:
;   - None; uses a global variable for the file path.
; Return: None; opens a text file for user reference.
; ----------------------------------------------------------------------------------------
openWiki(*) {
    Run "https://github.com/waktool/FusePets/wiki"
}

; ----------------------------------------------------------------------------------------
; pauseMacro Function
; Description: Toggles the pause state of the macro.
; Operation:
;   - Sends a keystroke to simulate a pause/unpause command.
;   - Toggles the pause state of the script.
; Dependencies:
;   - Send: Function to simulate keystrokes.
; Parameters:
;   - None
; Return: None; toggles the paused state of the macro.
; ----------------------------------------------------------------------------------------
pauseMacro(*) {
    Pause -1  ; Toggle the pause status of the macro.
}

; ----------------------------------------------------------------------------------------
; exitMacro Function
; Description: Exits the macro application completely.
; Operation:
;   - Terminates the application.
; Dependencies:
;   - ExitApp: Command to exit the application.
; Parameters:
;   - None
; Return: None; closes the application.
; ----------------------------------------------------------------------------------------
exitMacro(*) {
    ExitApp  ; Exit the macro application.
}


; ▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰
; SUPERCOMPUTER! FUNCTIONS
; ▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰

; ----------------------------------------------------------------------------------------
; fusePets Function
; Description: Fuses a list of pets by interacting with the game's supercomputer interface, handling various states and actions required for the fusion process.
; Operation:
;   - Retrieves the list of pets to be fused from settings.
;   - Iterates through the list of pets and attempts to fuse them using the supercomputer interface.
;   - Checks if pets are missing and handles UI interactions for successful or failed fusions.
; Dependencies:
;   - getSetting: Retrieves various settings, including the list of pets to fuse.
;   - openSupercomputer: Ensures the supercomputer menu is opened.
;   - findAndClickFuseButton: Finds and clicks the fuse button.
;   - searchForPet: Searches for the specified pet.
;   - petMissing: Checks if the specified pet is missing.
;   - closeSuperComputer: Closes the supercomputer interface.
;   - selectFuseAngle: Adjusts the selection angle to find a position where the pet can be fused.
;   - clickOkButton: Clicks the OK button to confirm the fusion.
;   - clickSuccessButton: Clicks the success button after fusion.
; Parameters: None
; Return: None
; ----------------------------------------------------------------------------------------
fusePets() {
    petsToFuse := StrSplit(getSetting("Pets"), ",")  ; Retrieve the list of pets to be fused from settings.
    firstPet := [364, 209]  ; Coordinates for the first pet (center). Note Perfect centre (362, 208.5).
    petOffset := [101, 0]  ; Offset for subsequent pets.

    for pet in petsToFuse {
        petNumber := 0
        Loop {
            if petNumber > 4
                break

            currentPet := [firstPet[1] + (petOffset[1] * petNumber), firstPet[2]]  ; Calculate the coordinates for the current pet.
            openSupercomputer()  ; Open the supercomputer interface.
            findAndClickFuseButton()  ; Find and click the fuse button.
            searchForPet(pet)  ; Search for the specified pet.
            
            if petMissing(currentPet) {
                closeSuperComputer()  ; Close the supercomputer if the pet is missing.
                break
            }
            
            canBeFused := selectFuseAngle(currentPet)  ; Adjust the selection angle to find a position where the pet can be fused.
            
            if canBeFused {
                clickOkButton()  ; Click the OK button to confirm the fusion.
                clickSuccessButton()  ; Click the success button after fusion.
            } else {
                petNumber += 1  ; Move to the next pet if the current pet cannot be fused.
                closeSuperComputer()  ; Close the supercomputer interface.
            }
        }
    }
}

; ----------------------------------------------------------------------------------------
; searchForPet Function
; Description: Searches for a pet by entering the specified search text in the supercomputer search box.
; Operation:
;   - Focuses on the search box within the supercomputer.
;   - Enters the required search terms.
;   - Waits briefly to allow time for the text entry to be processed.
; Dependencies:
;   - selectSupercomputerSearchBox: Focuses on the search box within the supercomputer.
;   - SendText: Enters the specified text into the focused input.
;   - Sleep: Pauses execution for a specified duration.
; Parameters:
;   - searchText: The text to be entered in the search box.
; Return: None
; ----------------------------------------------------------------------------------------
searchForPet(searchText) {
    selectSupercomputerSearchBox()  ; Focus on the search box within the supercomputer.
    SendText searchText  ; Enter the required search terms.
    Sleep 500  ; Allow time for the text entry to be processed.
}

; ----------------------------------------------------------------------------------------
; petMissing Function
; Description: Checks if a pet is missing by performing a pixel search for a specific color at the pet's position.
; Operation:
;   - Defines the position and color for the pet's position.
;   - Uses PixelSearch to find the specified color within the defined coordinates.
;   - Returns the result of the PixelSearch function, indicating whether the specified color was found.
; Dependencies:
;   - PixelSearch: Function that searches a rectangular area of the screen for a pixel with a specific color.
; Parameters:
;   - currentPet: Array containing the coordinates of the current pet.
; Return: Boolean indicating whether the pet is missing (true if the color is found, false otherwise).
; ----------------------------------------------------------------------------------------
petMissing(currentPet) {
    petPosition := Map("Start", currentPet, "End", currentPet, "Colour", "0xFFFFFF", "Tolerance", 2)
    
    ; Perform pixel search within specified coordinates and color.
    return PixelSearch(&foundX, &foundY, 
        petPosition["Start"][1], petPosition["Start"][2],  
        petPosition["End"][1], petPosition["End"][2],  
        petPosition["Colour"], petPosition["Tolerance"])
}

; ----------------------------------------------------------------------------------------
; openSupercomputer Function
; Description: Ensures the supercomputer menu is opened by repeatedly checking its status and walking away and returning if necessary.
; Operation:
;   - Continuously checks if the supercomputer menu is displayed.
;   - If the menu is not displayed, moves the character away and back to trigger the menu.
;   - Exits the loop once the menu is successfully displayed.
; Dependencies:
;   - isSupercomputerMenuDisplayed: Function that checks if the supercomputer menu is displayed.
;   - moveLeft: Function that moves the character left for a specified duration.
;   - moveRight: Function that moves the character right for a specified duration.
; Parameters: None
; Return: None
; ----------------------------------------------------------------------------------------
openSupercomputer() {
    
    Loop {  ; Make sure the supercomputer menu is opened.
        
        Loop 100 {  ; Wait for the supercomputer menu to open.
            superComputerMenuDisplayed := isSupercomputerMenuDisplayed()
            if superComputerMenuDisplayed
                break
            Sleep 50
        }

        if !superComputerMenuDisplayed {  ; If it doesn't open, walk away and come back to trigger it.
            moveLeft(2000)  ; Move left for 2000 milliseconds.
            closeSuperComputer()
            moveRight(2000)  ; Move right for 2000 milliseconds.
        }

        if superComputerMenuDisplayed  ; When it is open, exit the loop.
            break
    }
}

; ----------------------------------------------------------------------------------------
; selectFuseAngle Function
; Description: Adjusts the selection angle for fusing pets to find a position where the diamond indicator is displayed.
; Operation:
;   - Initiates a click down event on the current pet.
;   - Adjusts the selection angle in steps, first in an anti-clockwise direction from 20 degrees to 0 degrees.
;   - Rotates the selection clockwise in 0.5 degree increments up to 60 degrees.
;   - If the diamond indicator is not displayed, continues rotating in larger increments to cover additional angles.
;   - Returns whether the diamond indicator (can be fused) was displayed.
; Dependencies:
;   - SendEvent: Sends key and mouse events.
;   - selectAngle: Adjusts the selection angle for the pet.
;   - isDiamondDisplayed: Checks if the diamond indicator is displayed.
; Parameters:
;   - currentPet: Array containing the coordinates of the current pet.
; Return: Boolean indicating whether the diamond indicator (can be fused) was displayed (true if displayed, false otherwise).
; ----------------------------------------------------------------------------------------
selectFuseAngle(currentPet) {
    SendEvent "{Click down, " currentPet[1] ", " currentPet[2] ", 1}"  ; Click and hold on the current pet.
    Sleep 100  ; Pause briefly.

    ; Select 20 degrees and rotate anti-clockwise to 0 degrees for clockwise rotation.
    initialAngle := 20
    Loop initialAngle {
        selectAngle(currentPet, initialAngle)
        initialAngle--
        Sleep 50  ; Pause briefly between angle adjustments.
    }

    Sleep 100  ; Pause briefly.

    canBeFused := false

    ; Rotate in 0.5 degree increments up to 60 degrees to find the diamond indicator.
    Loop 120 {
        selectAngle(currentPet, A_Index / 2)
        Sleep 50  ; Pause briefly between angle adjustments.
        if isDiamondDisplayed() {
            canBeFused := true
            break  ; Exit the loop if the diamond indicator is displayed.
        }
    }

    ; If the diamond indicator is not displayed, continue rotating in larger increments.
    if !canBeFused {
        Loop 30 {
            selectAngle(currentPet, 60 + (A_Index * 10))
            Sleep 50  ; Pause briefly between angle adjustments.
            if isDiamondDisplayed() {
                canBeFused := true
                break  ; Exit the loop if the diamond indicator is displayed.
            }
        }
    }

    SendEvent "{Click up}"  ; Release the click.

    return canBeFused  ; Return whether the diamond indicator was displayed.
}

; ----------------------------------------------------------------------------------------
; closeSuperComputer Function
; Description: Closes the supercomputer window by clicking the close button at the specified coordinates.
; Operation:
;   - Simulates a left mouse click at the coordinates of the supercomputer window's close button.
; Dependencies:
;   - leftClickMouse: Simulates a left mouse click at the specified coordinates.
; Parameters: None
; Return: None
; ----------------------------------------------------------------------------------------
closeSuperComputer() {
    leftClickMouse([730, 109])  ; Click the close button of the supercomputer window.
}

; ----------------------------------------------------------------------------------------
; clickSuccessButton Function
; Description: Clicks the success OK button to confirm an action and waits until the success window is no longer displayed.
; Operation:
;   - Defines the coordinates for the success OK button.
;   - Enters a loop to wait for the success window to be displayed.
;   - Clicks the success OK button once the window is detected.
;   - Enters another loop to wait until the success window is no longer displayed.
; Dependencies:
;   - isSuccessWindowDisplayed: Checks if the success window is displayed.
;   - leftClickMouse: Simulates a left mouse click at the specified coordinates.
; Parameters: None
; Return: None
; ----------------------------------------------------------------------------------------
clickSuccessButton() {
    okSuccessButton := [468, 432]  ; Coordinates for the success OK button.

    Loop 100 {
        Sleep 50  ; Pause briefly to allow the window to appear.
        if isSuccessWindowDisplayed() {  ; Check if the success window is displayed.
            leftClickMouse(okSuccessButton)  ; Click the success OK button.
            break  ; Exit the loop once the button is clicked.
        }
    }

    Loop 100 {
        if !isSuccessWindowDisplayed()  ; Check if the success window is no longer displayed.
            break  ; Exit the loop once the window is closed.
    }
}

; ----------------------------------------------------------------------------------------
; clickOkButton Function
; Description: Clicks the OK button to confirm an action and exits the loop once the supercomputer menu is no longer displayed.
; Operation:
;   - Moves the mouse to the OK button coordinates.
;   - Activates mouse hover.
;   - Clicks the OK button repeatedly until the supercomputer menu is no longer displayed.
; Dependencies:
;   - MouseMove: Moves the mouse cursor to specified coordinates.
;   - activateMouseHover: Activates mouse hover to ensure the button is interactive.
;   - leftClickMouse: Simulates a left mouse click at the specified coordinates.
;   - isSupercomputerMenuDisplayed: Checks if the supercomputer menu is still displayed.
; Parameters: None
; Return: None
; ----------------------------------------------------------------------------------------
clickOkButton() {
    okFuseButton := [168, 423]  ; Coordinates for the OK button.
    Sleep 100  ; Pause briefly to ensure the previous action is complete.
    
    MouseMove okFuseButton[1], okFuseButton[2]  ; Move the mouse to the OK button coordinates.
    activateMouseHover()  ; Activate mouse hover.

    Loop {
        leftClickMouse(okFuseButton)  ; Click the OK button.
        Sleep 250  ; Pause briefly to allow the click action to register.
        
        if !isSupercomputerMenuDisplayed()
            break  ; Exit the loop if the supercomputer menu is no longer displayed.
    }
}

; ----------------------------------------------------------------------------------------
; moveLeft Function
; Description: Moves the character to the left for a specified amount of time.
; Operation:
;   - Sends the key down event for the 'a' key.
;   - Pauses for the specified duration to move left.
;   - Sends the key up event for the 'a' key to stop moving.
; Dependencies:
;   - Send: Sends key events.
;   - Sleep: Pauses execution for a specified duration.
; Parameters:
;   - time: The duration (in milliseconds) to hold the 'a' key down.
; Return: None
; ----------------------------------------------------------------------------------------
moveLeft(time) {
    Send "{a down}"  ; Press and hold the 'a' key to move left.
    Sleep time  ; Pause for the specified duration.
    Send "{a up}"  ; Release the 'a' key to stop moving.
}

; ----------------------------------------------------------------------------------------
; moveRight Function
; Description: Moves the character to the right for a specified amount of time.
; Operation:
;   - Sends the key down event for the 'd' key.
;   - Pauses for the specified duration to move right.
;   - Sends the key up event for the 'd' key to stop moving.
; Dependencies:
;   - Send: Sends key events.
;   - Sleep: Pauses execution for a specified duration.
; Parameters:
;   - time: The duration (in milliseconds) to hold the 'd' key down.
; Return: None
; ----------------------------------------------------------------------------------------
moveRight(time) {
    Send "{d down}"  ; Press and hold the 'd' key to move right.
    Sleep time  ; Pause for the specified duration.
    Send "{d up}"  ; Release the 'd' key to stop moving.
}

; ----------------------------------------------------------------------------------------
; findAndClickFuseButton Function
; Description: Searches for and clicks the fuse button in the supercomputer menu by scrolling through the menu.
; Operation:
;   - Attempts to find and click the fuse button at the current position.
;   - If not found, scrolls the supercomputer menu to the top and searches again.
;   - Repeats the process by scrolling down through the menu.
; Dependencies:
;   - isFuseButtonFound: Checks if the fuse button is found by performing pixel searches.
;   - clickSupercomputerButton: Clicks the supercomputer button.
;   - scrollSupercomputerToTop: Scrolls the supercomputer menu to the top.
;   - scrollMouseWheel: Scrolls the mouse wheel.
; Parameters: None
; Return: Boolean indicating whether the fuse button was found and clicked (true if successful, false otherwise).
; ----------------------------------------------------------------------------------------
findAndClickFuseButton() {
    fuseButton := isFuseButtonFound()
    if isObject(fuseButton) {
        clickSupercomputerButton(fuseButton)
        return true
    }

    ; Attempt to find and click the fuse button by scrolling through the menu.
    Loop 5 {
        scrollSupercomputerToTop()
        Loop 4 {
            fuseButton := isFuseButtonFound()
            if isObject(fuseButton) {
                clickSupercomputerButton(fuseButton)
                return true
            }
            scrollMouseWheel("{WheelDown}")  ; Scroll the mouse wheel down once.
            Sleep 100  ; Pause briefly to ensure the scrolling is completed.
        }
    }
    return false  ; Return false if the fuse button was not found and clicked.
}

; ----------------------------------------------------------------------------------------
; scrollSupercomputerToTop Function
; Description: Scrolls the supercomputer menu to the top by moving the mouse to the center of the screen and scrolling up.
; Operation:
;   - Moves the mouse to the center of the screen.
;   - Activates mouse hover to ensure the menu is interactive.
;   - Scrolls the mouse wheel up 4 times to scroll the menu to the top.
; Dependencies:
;   - moveMouseToCentreOfScreen: Moves the mouse to the center of the screen.
;   - activateMouseHover: Activates mouse hover to ensure the menu is interactive.
;   - scrollMouseWheel: Scrolls the mouse wheel.
; Parameters: None
; Return: None
; ----------------------------------------------------------------------------------------
scrollSupercomputerToTop() {
    moveMouseToCentreOfScreen()  ; Move the mouse to the center of the screen.
    Sleep 100  ; Pause for a brief moment to ensure the mouse is positioned correctly.
    activateMouseHover()  ; Activate mouse hover.
    scrollMouseWheel("{WheelUp}", 4)  ; Scroll the mouse wheel up 4 times.
    Sleep 100  ; Pause for a brief moment to ensure the scrolling is completed.
}

; ----------------------------------------------------------------------------------------
; clickSupercomputerButton Function
; Description: Clicks the supercomputer button in a loop until the supercomputer menu is no longer displayed.
; Operation:
;   - Moves the mouse to the coordinates of the fuse button.
;   - Activates mouse hover.
;   - Clicks the fuse button and waits for a specified duration.
;   - Repeats the process until the supercomputer menu is no longer displayed.
; Dependencies:
;   - MouseMove: Moves the mouse cursor to specified coordinates.
;   - activateMouseHover: Activates mouse hover to ensure the button is interactive.
;   - leftClickMouseAndWait: Clicks the mouse and waits for a specified duration.
;   - isSupercomputerMenuDisplayed: Checks if the supercomputer menu is still displayed.
; Parameters:
;   - fuseButton: An array containing the coordinates of the fuse button.
; Return: None
; ----------------------------------------------------------------------------------------
clickSupercomputerButton(fuseButton) {
    Loop {
        MouseMove fuseButton[1], fuseButton[2]  ; Move the mouse to the coordinates of the fuse button.
        activateMouseHover()  ; Activate mouse hover.
        leftClickMouseAndWait(fuseButton, 250)  ; Click the button and wait for 250 milliseconds.
        if !isSupercomputerMenuDisplayed()
            break  ; Exit the loop if the supercomputer menu is no longer displayed.
    }
    
    buttonFound := true  ; Set buttonFound to true to indicate the button was clicked successfully.
}

; ----------------------------------------------------------------------------------------
; isFuseButtonFound Function
; Description: Checks if the fuse button is found by performing pixel searches for specific colors within a defined area.
; Operation:
;   - Defines the colors for the fuse button and the search area for the supercomputer window.
;   - Sets the color tolerance for the search.
;   - Uses PixelSearch to find the first color within the defined area.
;   - If the first color is found, moves the mouse to that location.
;   - Searches for the second color near the first color found.
;   - Returns the coordinates of the second color if found.
; Dependencies:
;   - PixelSearch: Function that searches a rectangular area of the screen for a pixel with a specific color.
;   - MouseMove: Moves the mouse cursor to specified coordinates.
; Parameters: None
; Return: Array containing the coordinates of the second color if found, otherwise none.
; ----------------------------------------------------------------------------------------
isFuseButtonFound() {
    fusePetsButton := ["0xE02552", "0x48D7E9"]  ; Define the colors for the fuse button.
    superComputerWindow := Map("Start", [64, 173], "End", [754, 505])  ; Define the search area for the supercomputer window.
    colourTolerance := 2  ; Set the color tolerance for the search.

    ; Perform pixel search for the first color within the defined area.
    if PixelSearch(&foundX1, &foundY1, 
        superComputerWindow["Start"][1], superComputerWindow["Start"][2],  
        superComputerWindow["End"][1], superComputerWindow["End"][2],  
        fusePetsButton[1], colourTolerance) {
        
        MouseMove foundX1, foundY1  ; Move the mouse to the first color found.
        
        ; Search for the second color near the first color found.
        if PixelSearch(&foundX2, &foundY2, 
            foundX1 - 50, foundY1 - 50,  
            foundX1 + 50, foundY1 + 50,  
            fusePetsButton[2], colourTolerance) {
            
            return [foundX2, foundY2]  ; Return the coordinates of the second color if found.
        }
    }
    return false  ; Return false if the fuse button is not found.
}

; ----------------------------------------------------------------------------------------
; selectSupercomputerSearchBox Function
; Description: Selects the search box within the Supercomputer interface by clicking on it.
; Operation:
;   - Performs a left mouse click at the coordinates specified for the search box.
; Dependencies:
;   - leftClickMouseAndWait: Function to handle mouse click and wait for a predefined action to complete.
; Return: None; initiates UI interaction by selecting the search box.
; ----------------------------------------------------------------------------------------
selectSupercomputerSearchBox() {
    supercomputerSearchBox := [530, 107]
    leftClickMouseAndWait(supercomputerSearchBox, 500)
}

; ----------------------------------------------------------------------------------------
; isSupercomputerMenuDisplayed Function
; Description: Checks if the supercomputer menu is displayed by performing a pixel search within the specified area and color.
; Operation:
;   - Defines the coordinates, color, and tolerance for the supercomputer icon.
;   - Uses PixelSearch to find the specified color within the defined coordinates.
;   - Returns the result of the PixelSearch function, indicating whether the specified color was found.
; Dependencies:
;   - PixelSearch: Function that searches a rectangular area of the screen for a pixel with a specific color.
; Parameters: None
; Return: Boolean indicating whether the supercomputer menu is displayed (true if the color is found, false otherwise).
; ----------------------------------------------------------------------------------------
isSupercomputerMenuDisplayed() {
    supercomputerIcon := Map("Start", [54, 115], "End", [54, 115], "Colour", "0x0785F2", "Tolerance", 2)
    
    ; Perform pixel search within specified coordinates and color.
    return PixelSearch(&foundX, &foundY, 
        supercomputerIcon["Start"][1], supercomputerIcon["Start"][2],  
        supercomputerIcon["End"][1], supercomputerIcon["End"][2],  
        supercomputerIcon["Colour"], supercomputerIcon["Tolerance"])        
}

; ----------------------------------------------------------------------------------------
; isDiamondDisplayed Function
; Description: Checks if a diamond is displayed on the screen by performing a pixel search within the specified area and color.
; Operation:
;   - Defines the coordinates, color, and tolerance for the diamond.
;   - Uses PixelSearch to find the specified color within the defined coordinates.
;   - Returns the result of the PixelSearch function, indicating whether the specified color was found.
; Dependencies:
;   - PixelSearch: Function that searches a rectangular area of the screen for a pixel with a specific color.
; Parameters: None
; Return: Boolean indicating whether the diamond is displayed (true if the color is found, false otherwise).
; ----------------------------------------------------------------------------------------
isDiamondDisplayed() {
    diamond := Map("Start", [131, 358], "End", [131, 358], "Colour", "0x0E9EED", "Tolerance", 2)
    
    ; Perform pixel search within specified coordinates and color.
    return PixelSearch(&foundX, &foundY, 
        diamond["Start"][1], diamond["Start"][2],  
        diamond["End"][1], diamond["End"][2],  
        diamond["Colour"], diamond["Tolerance"])    
}

; ----------------------------------------------------------------------------------------
; isSuccessWindowDisplayed Function
; Description: Checks if the success window is displayed by performing a pixel search for the OK button within the specified area and color.
; Operation:
;   - Defines the coordinates, color, and tolerance for the OK button.
;   - Uses PixelSearch to find the specified color within the defined coordinates.
;   - Returns the result of the PixelSearch function, indicating whether the specified color was found.
; Dependencies:
;   - PixelSearch: Function that searches a rectangular area of the screen for a pixel with a specific color.
; Parameters: None
; Return: Boolean indicating whether the success window is displayed (true if the color is found, false otherwise).
; ----------------------------------------------------------------------------------------
isSuccessWindowDisplayed() {
    okButton := Map("Start", [468, 432], "End", [468, 432], "Colour", "0x77F40A", "Tolerance", 2)
    
    ; Perform pixel search within specified coordinates and color.
    return PixelSearch(&foundX, &foundY, 
        okButton["Start"][1], okButton["Start"][2],  
        okButton["End"][1], okButton["End"][2],  
        okButton["Colour"], okButton["Tolerance"])        
}

; ----------------------------------------------------------------------------------------
; selectAngle Function
; Description: Calculates the X and Y coordinates based on the given angle and moves the mouse to the new position relative to the machine item.
; Operation:
;   - Converts the given angle to radians.
;   - Calculates the new X and Y coordinates using trigonometric functions (cosine and sine).
;   - Moves the mouse to the new coordinates.
; Dependencies: None
; Parameters:
;   - itemCoordinates: An array containing the base X and Y coordinates of the machine item.
;   - angle: The angle in degrees to calculate the new mouse position.
; Return: None
; ----------------------------------------------------------------------------------------
selectAngle(itemCoordinates, angle) {
    X := itemCoordinates[1] + RADIUS * Cos((angle - 90) * PI / 180)  ; Calculate the X coordinate.
    Y := itemCoordinates[2] + RADIUS * Sin((angle - 90) * PI / 180)  ; Calculate the Y coordinate.
    MouseMove X, Y  ; Move mouse to the new calculated position.
}


; ▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰
; MOUSE FUNCTIONS
; ▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰

; ----------------------------------------------------------------------------------------
; moveMouseToCentreOfScreen Function
; Description: Moves the mouse cursor to the center of the screen and pauses briefly to stabilize its position.
; Operation:
;   - Moves the mouse cursor to the center coordinates (400, 300).
;   - Pauses for a short duration to ensure the cursor stabilizes.
; Dependencies:
;   - MouseMove: Function that moves the mouse cursor to specified coordinates.
;   - Sleep: Function that pauses execution for a specified duration.
; Parameters: None
; Return: None
; ----------------------------------------------------------------------------------------
moveMouseToCentreOfScreen() {
    MouseMove 400, 300  ; Move cursor to screen center (assuming 800x600 resolution).
    Sleep 100  ; Pause to stabilize cursor position.
}

; ----------------------------------------------------------------------------------------
; leftClickMouse Function
; Description: Executes a left-click at a specified screen position.
; Parameters:
;   - Position: Can be an array with X and Y coordinates or a string key for coordinates from 'COORDS'.
; Operation:
;   - Checks if 'Position' is an object (array) or a string.
;   - Performs a left-click at the appropriate coordinates.
; Return: None; directly interacts with the UI by performing a click.
; ----------------------------------------------------------------------------------------
leftClickMouse(clickPosition) {
    SendEvent "{Click, " clickPosition[1] ", " clickPosition[2] ", 1}"  ; Left-click using array coordinates.
}

; ----------------------------------------------------------------------------------------
; leftClickMouseAndWait Function
; Description: Executes a left-click at a specified screen position, followed by a pause.
; Parameters:
;   - Position: Can be an array with X and Y coordinates or a string key for named coordinates from 'COORDS'.
;   - Time: Duration in milliseconds to wait after the click.
; Operation:
;   - Determines if 'Position' is an object (array) or a string, and performs a left-click at the coordinates.
;   - Waits for the specified 'Time' to allow UI interactions to complete.
; Return: None; affects the UI by executing a click and delay.
; ----------------------------------------------------------------------------------------
leftClickMouseAndWait(clickPosition, timeToWait) {
    SendEvent "{Click, " clickPosition[1] ", " clickPosition[2] ", 1}"  ; Left-click using array coordinates.
    Sleep timeToWait  ; Pause for specified duration.
}

; ----------------------------------------------------------------------------------------
; activateMouseHover Function
; Description: Simulates a mouse hover by briefly moving the cursor. Useful for triggering hover-sensitive UI elements.
; Operation:
;   - Pauses for 50 ms, moves the cursor by 1 pixel right and down, pauses again, moves back by 1 pixel, and final pause.
; Return: None (affects the mouse's position only)
; ----------------------------------------------------------------------------------------
activateMouseHover() {
    Sleep 50  ; Stabilizes mouse context.
    MouseMove 1, 1,, "R"  ; Move cursor right and down by 1 pixel.
    Sleep 50  ; Allows UI to react.
    MouseMove -1, -1,, "R"  ; Return cursor to original position.
    Sleep 50  ; Ensures UI updates.
}

; ----------------------------------------------------------------------------------------
; scrollMouseWheel Function
; Description: Scrolls the mouse wheel in a specified direction for a given number of increments.
; Parameters:
;   - Direction: The direction to scroll ('up' or 'down').
;   - Scrolls: The number of increments to scroll.
; Operation:
;   - Loops through the number of specified scrolls.
;   - Sends a scroll command in the given direction for each iteration.
;   - Includes a brief pause between scrolls to simulate a realistic scrolling speed.
; Return: None; directly manipulates the mouse wheel.
; ----------------------------------------------------------------------------------------
scrollMouseWheel(scrollDirection, timesToScroll := 1) {
    Loop timesToScroll {  ; Repeat scroll for the number of specified increments.
        Send scrollDirection  ; Send scroll command in the specified direction.
        Sleep 50  ; Short pause to mimic natural scrolling behavior.
    }
}


; ▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰
; ROBLOX CLIENT FUNCTIONS
; ▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰

; ----------------------------------------------------------------------------------------
; activateRoblox Function
; Description: Activates the Roblox game window, ensuring it's the current foreground application.
; Operation:
;   - Attempts to activate the Roblox window using its executable name.
;   - If the window cannot be found, displays an error message and exits the application.
;   - Waits for a predefined delay after successful activation to stabilize the environment.
; Dependencies:
;   - WinActivate: AHK command to focus a window based on given criteria.
;   - MsgBox ExitApp: Functions to handle errors and exit.
;   - Wait: Function to pause the script, ensuring timing consistency.
; Return: None; the function directly interacts with the system's window management.
; ----------------------------------------------------------------------------------------
activateRoblox() {
    try {
        WinActivate "ahk_exe RobloxPlayerBeta.exe"  ; Try to focus on Roblox window.
    } catch {
        MsgBox "Roblox window not found."  ; Error message if window is not found.
        ExitApp  ; Exit the script.
    }
    Sleep 200
}

; ----------------------------------------------------------------------------------------
; resizeRobloxWindow Function
; Description: Resizes the Roblox window to specific dimensions to fix any scaling issues with the Supercomputer.
; Operation:
;   - Activates the Roblox window.
;   - Restores the Roblox window if it is minimized.
;   - Resizes the window twice to ensure any scaling issues are fixed.
; Dependencies:
;   - WinActivate: Activates the specified window.
;   - WinRestore: Restores the specified window if it is minimized.
;   - WinMove: Resizes and moves the specified window.
; Parameters: None
; Return: None
; ----------------------------------------------------------------------------------------
resizeRobloxWindow() {
    WinActivate "ahk_exe RobloxPlayerBeta.exe"  ; Activate the Roblox window.
    WinRestore "ahk_exe RobloxPlayerBeta.exe"   ; Restore the Roblox window if it is minimized.
    
    ; Resize the window twice to fix any scaling issues with the Supercomputer.
    WinMove , , A_ScreenWidth, 600, "ahk_exe RobloxPlayerBeta.exe"  ; Resize the window to screen width by 600 pixels height.
    WinMove , , 800, 600, "ahk_exe RobloxPlayerBeta.exe"  ; Resize the window to 800x600 pixels dimensions.
}


; ▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰
; SETTINGS.INI FUNCTIONS
; ▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰

; ----------------------------------------------------------------------------------------
; getSetting Function
; Description: Retrieves a setting value from an INI file based on a given key.
; Parameters:
;   - Key: The setting key whose value is to be retrieved.
; Operation:
;   - Reads the value associated with the specified key from a designated INI file section.
; Dependencies:
;   - IniRead: Function used to read data from an INI file.
;   - SETTINGS_INI: Global variable specifying the path to the INI file.
; Return: The value of the specified setting key, returned as a string.
; ----------------------------------------------------------------------------------------
getSetting(keyName) {
    return IniRead(SETTINGS_INI, "Settings", keyName)  ; Read and return the setting value from the INI file.
}


; ▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰
; INITIALISATION SETTINGS/FUNCTIONS
; ▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰

; ----------------------------------------------------------------------------------------
; completeInitialisationTasks Function
; Description: Completes a series of initialization tasks to set up the environment for the Roblox macro.
; Operation:
;   - Updates the tray icon.
;   - Resizes the Roblox window to address scaling issues.
;   - Defines hotkeys for various macro functions.
;   - Zooms the camera out to the maximum level.
; Dependencies:
;   - updateTrayIcon: Updates the tray icon.
;   - resizeRobloxWindow: Resizes the Roblox window to specific dimensions.
;   - defineHotKeys: Defines hotkeys for various macro functions.
;   - zoomCameraOut: Zooms the camera out to the maximum level.
; Parameters: None
; Return: None
; ----------------------------------------------------------------------------------------
completeInitialisationTasks() {
    updateTrayIcon()  ; Update the tray icon.
    resizeRobloxWindow()  ; Resize the Roblox window to address scaling issues.
    defineHotKeys()  ; Define hotkeys for various macro functions.
}

; ----------------------------------------------------------------------------------------
; defineHotKeys Function
; Description: Sets up hotkeys for controlling macros based on user settings.
; Operation:
;   - Retrieves hotkey settings and binds them to macro control functions.
; Dependencies: getSetting: Retrieves user-configured hotkey preferences.
; Return: None; configures hotkeys for runtime use.
; ----------------------------------------------------------------------------------------
defineHotKeys() {
    HotKey getSetting("pauseMacroKey"), pauseMacro  ; Bind pause macro hotkey.
    HotKey getSetting("exitMacroKey"), exitMacro  ; Bind exit macro hotkey.
}

; ----------------------------------------------------------------------------------------
; updateTrayIcon Function
; Description: Sets a custom icon for the application in the system tray.
; Operation:
;   - Composes the file path for the icon and sets it as the tray icon.
; Dependencies: None.
; Return: None; changes the tray icon appearance.
; ----------------------------------------------------------------------------------------
updateTrayIcon() {
    iconFile := A_WorkingDir . "\Assets\PS99_Fuse_Machine.ico"  ; Set the tray icon file path.
    TraySetIcon iconFile  ; Apply the new tray icon.
}
