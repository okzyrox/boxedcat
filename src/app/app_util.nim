include applet/event/applet_keyboard_event

proc AppletEvent*(appletTypeStr:string) =
    let appletType = appletTypeStr

    case appletType:
        of "softwareKeyboardApplet":
            applet_OpenSoftwareKeyboardInputWindow(title="Applet Test", desc="Applet Test desc")