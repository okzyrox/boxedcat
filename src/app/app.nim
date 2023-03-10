#[
  boxedcat - an okzyrox experimental project

  2022-2023

  app main
]#

include nigui
include nigui/msgbox
import strutils
import ../core/boxedcat/util/logger/logger
include settings/settings_handler
import app_util

let 
    isNotCliApp:bool = true # "dont run in CLI?", not impl yet technically
    noClosePopupApp:bool = false # confirm whether to close each time

const
    APPICONPATH = "icon_64x64.png"
    FILETYPES = @[
        ".nro", ".nca", ".xci", ".nsp"
    ]

proc appletProcess() =
    log("Applet Processing has not been implemented yet!", "WARN")

proc startEmulationProcessWindow() =
    log("Core Emulation has not been implemented yet!", "WARN")

proc windowAppMain() =

    app.init() # init

    var window = newWindow(title="BoxedCat Window")
    # A window can contain only one control.
    # A container can contain multiple controls.

    window.width = 800.scaleToDpi
    window.height = 600.scaleToDpi
    #window.iconPath=APPICONPATH

    # core container

    var containerCore = newLayoutContainer(Layout_Vertical)
    var containerTop = newLayoutContainer(Layout_Horizontal)
    var containerBot = newLayoutContainer(Layout_Vertical)
    
    # settings window init
    let settingWindow = newWindow(title="Settings")
    var 
        settingsContainerCore = newLayoutContainer(Layout_Vertical)
        settingsContainerTop = newLayoutContainer(Layout_Horizontal)
        settingsContainerBot = newLayoutContainer(Layout_Vertical)

    containerCore.add(containerTop)
    containerCore.add(containerBot)

    settingsContainerCore.add(settingsContainerTop)
    settingsContainerCore.add(settingsContainerBot)

    window.add(containerCore)
    settingWindow.add(settingsContainerCore)
    # Add the container to the window.

    # Containers and Buttons Init 

    var 
        #containerCore
        ##containerTop
        buttonOpenFile = newButton("Open File (.nro, .xci, .nsp, .nca)")
        buttonOpenSettings = newButton("Settings")
        buttonDevRunTestApplet = newButton("Applet")
        ##containerBot
        logFieldHeaderText = newLabel("App-specific Events Log:")
        logTextArea = newTextArea() # multiline txtbox

        ##settingsContainerCore
        #containerTop
        settingsTabButtonGeneral = newButton("General")
        settingsTabButtonControl = newButton("Control")
        settingsTabButtonEmulation = newButton("Emulation")
        #containerBottomTabGeneral
        setting_General_VSync = newCheckbox("VSync")
        setting_General_ExpMemBuf = newCheckbox("Expand Memory Buffer (8GB+ recommended)")

        #settings get
        setVsyncC = configDict.getSectionValue("General", "VSync")
        setExpMemBuf = configDict.getSectionValue("General", "ExpandMemoryBuffer")
    
    if setVsyncC == "true": setting_General_VSync.checked = true
    if setExpMemBuf == "true": setting_General_ExpMemBuf.checked = true

    var 
        settingsTabGeneralHidden = false
        settingsTabControlHidden = true
        settingsTabEmulationHidden = true

    #ContainerCore
    containerTop.add(buttonOpenFile)
    containerTop.add(buttonOpenSettings)
    containerTop.add(buttonDevRunTestApplet)
    containerBot.add(logFieldHeaderText)
    containerBot.add(logTextArea)

    #settingsContainerCore

    settingsContainerTop.add(settingsTabButtonGeneral)
    settingsContainerTop.add(settingsTabButtonControl)
    settingsContainerTop.add(settingsTabButtonEmulation)

    #settingsContainerTabGeneral
    settingsContainerBot.add(setting_General_VSync)
    settingsContainerBot.add(setting_General_ExpMemBuf)

    # Button Events

    buttonOpenFile.onClick = proc(event: ClickEvent) =
        # Set an event handler for the "onClick" event (here as anonymous proc).
        let fileDiaOpen = newOpenFileDialog()
        fileDiaOpen.title = "Open File"
        fileDiaOpen.multiple = false
        fileDiaOpen.run()
        log("appFileDialogOpen:run()", "INFO")

        logTextArea.addLine($fileDiaOpen.files.len & " file selected:")
        if fileDiaOpen.files.len > 0:
            for file in fileDiaOpen.files:
                logTextArea.addLine("File-path : " & file)
                log("appFileDialogOpen - selected (path): " & file, "INFO")
        else:
            log("appFileDialogOpen - selected None", "INFO")

    buttonOpenSettings.onClick = proc(event: ClickEvent) = 
        
        settingWindow.show()
        log("appWindow:Settings.show()", "INFO")
        logTextArea.addLine("appWindow:Settings.show()")
        settingWindow.onCloseClick = proc(event: CloseClickEvent) = 
            settingWindow.hide()
            log("appWindow:Settings closed", "INFO")
            logTextArea.addLine("appWindow:Settings closed")

    settingsTabButtonGeneral.onClick = proc(event: ClickEvent) = 
        var e = 0
        if settingsTabGeneralHidden:
            settingsContainerBot.show()
            log("appWindow:Settings:General.show()", "INFO")
            settingsTabGeneralHidden = false
            settingsTabControlHidden = true
            settingsTabEmulationHidden = true
        else:
            settingsContainerBot.hide()
            log("appWindow:Settings:General.hide()", "INFO")
            settingsTabGeneralHidden = true
    
    setting_General_VSync.onClick = proc(event: ClickEvent) = 
        var checked:bool

        if setting_General_VSync.checked == false:
            checked = true
        else:
            checked = false
        
        log("appWindow:Settings:General:Vsync - " & $checked, "NOTICE")
    
    setting_General_ExpMemBuf.onClick = proc(event: ClickEvent) = 
        var checked:bool

        if setting_General_ExpMemBuf.checked == false:
            checked = true
        else:
            checked = false
        
        log("appWindow:Settings:General:ExpandMemoryBuffer - " & $checked, "NOTICE")

    buttonDevRunTestApplet.onClick = proc(event: ClickEvent) =
         
        AppletEvent("softwareKeyboardApplet")
        log("Software-Applet Initiated - Keyboard Input", "DEBUG")


    window.show()
    # Make the window visible on the screen.
    # Controls (containers, buttons, ..) are visible by default.

    window.onCloseClick = proc(event: CloseClickEvent) =
        if noClosePopupApp:
            window.dispose()
        else:
            case window.msgBox(
                message="Are you sure you want to quit?", 
                title="BoxedCat Alert", 
                button1="Quit", 
                button2="Minimize", 
                button3="Cancel")
            of 1: 
                window.dispose()
                log("\'appWindow\' closed", "INFO")
            of 2: 
                window.minimize()
            else: 
                discard

    app.run()