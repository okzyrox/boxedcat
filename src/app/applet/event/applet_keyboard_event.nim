#[
  boxedcat - an okzyrox experimental project

  2022-2023

  applet - softwareKeyboard
]#

include nigui
include nigui/msgbox

var
    applet_textFieldInput:string

    applet_textFieldInputDigitOnly:bool
    applet_textFieldInputStringOnly:bool

    applet_textFieldContentTitle:string
    applet_textFieldContentDesc:string
    applet_textFieldContentPlaceholder:string#

    applet_windowVisible:bool

proc applet_OpenSoftwareKeyboardInputWindow*(title:string, desc:string) = 

    app.init()

    var appletWindow = newWindow(title="Keyboard Input - ")

    appletWindow.width = 400.scaleToDpi
    appletWindow.height = 400.scaleToDpi

    var applet_Container = newLayoutContainer(Layout_Vertical)
    var applet_ContainerBottomrow = newLayoutContainer(Layout_Horizontal)

    let 
        applet_textInputArea = newTextBox()

        applet_buttonConfirm = newButton("Confirm")
        applet_buttonCancel = newButton("Cancel")
    
    appletWindow.add(applet_Container)

    applet_Container.add(applet_textInputArea)
    applet_Container.add(applet_ContainerBottomrow)
    applet_ContainerBottomrow.add(applet_buttonConfirm)
    applet_ContainerBottomrow.add(applet_buttonCancel)

    appletWindow.show()
    app.run()
