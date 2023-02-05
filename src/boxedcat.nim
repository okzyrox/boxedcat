#[
  boxedcat - an okzyrox experimental project

  2022-2023

  main
]#

include "core/core_ini.nim"
include "core/loader_ini.nim"
include "app/app.nim"
import core/boxedcat/util/logger/logger

when isMainModule:
  addLogger stdout # logging init1
  addLogger open("boxedcat.log", fmWrite) # start logging file; logging init2
  log("Starting Boxedcat...\n", "INFO")
  echo core_CoreInit()
  echo core_LoaderInit()
  if isNotCliApp:
    log("Attempting \'appWindow\' init", "INFO")
    windowAppMain() # window

#[ ref because its understandable despite it being a translation layer
https://github.com/skyline-emu/skyline/tree/ftx1/app/src/main/cpp/skyline
https://github.com/skyline-emu/skyline/blob/ftx1/app/src/main/cpp/skyline/os.cpp
https://github.com/skyline-emu/skyline/blob/ftx1/app/src/main/cpp/skyline/os.h
https://github.com/skyline-emu/skyline/tree/ftx1/app/src/main/cpp/skyline/common
https://github.com/skyline-emu/skyline/blob/ftx1/app/src/main/cpp/skyline/common/logger.cpp
https://github.com/skyline-emu/skyline/tree/ftx1/app/src/main/cpp/skyline/loader

]#
  
