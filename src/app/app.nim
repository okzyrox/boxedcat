include nigui

let isNotCliApp:bool = true

proc windowAppMain() =

    app.init() # init

    var window = newWindow("BoxedCat Window")
    # Create a window with a given title:
    # By default, a window is empty and not visible.
    # It is played at the center of the screen.
    # A window can contain only one control.
    # A container can contain multiple controls.

    window.width = 600.scaleToDpi
    window.height = 400.scaleToDpi
    # Set the size of the window

    #window.iconPath = "app/app.png"
    # cant use it because problems
    # thanks nim!, for not having a clear definition on how to include local files in the output executable on compilation
    # i am very salty about this
    

    var container = newLayoutContainer(Layout_Vertical)
    # Create a container for controls.
    # By default, a container is empty.
    # It's size will adapt to it's child controls.
    # A LayoutContainer will automatically align the child controls.
    # The layout is set to clhorizontal.

    window.add(container)
    # Add the container to the window.

    var button1 = newButton("Button 1")
    var buttonExit = newButton("Exit")

    container.add(button1)
    container.add(buttonExit)
    # Add the button to the container.

    var textArea = newTextArea()
    # Create a multiline text box.
    # By default, a text area is empty and editable.

    container.add(textArea)
    # Add the text area to the container.

    button1.onClick = proc(event: ClickEvent) =
        # Set an event handler for the "onClick" event (here as anonymous proc).
        textArea.addLine("btn1 pressed")
        window.alert("msgbox") # waits until it's closed before doing the next line
        textArea.addLine("msgbox closed")

    buttonExit.onClick = proc(event: ClickEvent) = 
        app.quit() # close - temp

    window.show()
    # Make the window visible on the screen.
    # Controls (containers, buttons, ..) are visible by default.

    app.run()