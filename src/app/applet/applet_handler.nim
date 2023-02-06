#[
  boxedcat - an okzyrox experimental project

  2022-2023

  applet handler
]#

include "applet_handler_util.nim"
import ../../core/boxedcat/util/logger/logger # efficient i swear

var applets = newSeq[Applet]()

template appletHandler*(applet:Applet):int64 =
  log("appletHandlerApp init", "INFO")
