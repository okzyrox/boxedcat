#[
  boxedcat - an okzyrox experimental project

  2022-2023

  app main
]#

include nigui
include nigui/msgbox


let 
    isNotCliApp:bool = true # "dont run in CLI?"
    noClosePopupApp:bool = false # "confirm whether to close each time?"

const
    APPICONPATH = "icon_64x64.png"
    FILETYPES = @[
        ".nro", ".nca", ".xci", ".nsp"
    ]

proc windowAppMain() =

    app.init() # init

    var window = newWindow(title="BoxedCat Window")
    # A window can contain only one control.
    # A container can contain multiple controls.

    window.width = 800.scaleToDpi
    window.height = 600.scaleToDpi
    #window.iconPath=APPICONPATH

    var container = newLayoutContainer(Layout_Vertical)
    # Create a container for controls.
    # By default, a container is empty.
    # It's size will adapt to it's child controls.
    # A LayoutContainer will automatically align the child controls.
    # The layout is set to clhorizontal.

    window.add(container)
    # Add the container to the window.

    var buttonOpenFile = newButton("Open File (.nro, .xci, .nsp, .nca)")
    var logFieldHeaderText = newLabel("Log:")
    var logTextArea = newTextArea() # multiline txtbox

    container.add(buttonOpenFile)
    container.add(logFieldHeaderText)
    container.add(logTextArea)

    buttonOpenFile.onClick = proc(event: ClickEvent) =
        # Set an event handler for the "onClick" event (here as anonymous proc).
        let fileDiaOpen = newOpenFileDialog()
        fileDiaOpen.title = "Open File"
        fileDiaOpen.multiple = false
        fileDiaOpen.run()

        logTextArea.addLine($fileDiaOpen.files.len & " file selected:")
        if fileDiaOpen.files.len > 0:
            for file in fileDiaOpen.files:
                logTextArea.addLine("File-path : " & file)

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
                echo "\'appWindow\' closed"
            of 2: 
                window.minimize()
            else: 
                discard

    app.run()