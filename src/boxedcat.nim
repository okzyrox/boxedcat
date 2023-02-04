#[
  boxedcat - an okzyrox experimental project

  2022-2023

  main
]#

include "core/core_ini.nim"
include "core/loader_ini.nim"
include "app/app.nim"

when isMainModule:
  echo("Starting Boxedcat...\n")
  echo core_CoreInit()
  echo core_LoaderInit()
  if isNotCliApp:
    echo "Attempting \'appWindow\' init"
    windowAppMain() # window

#[ ref because its understandable despite it being a translation layer
https://github.com/skyline-emu/skyline/tree/ftx1/app/src/main/cpp/skyline
https://github.com/skyline-emu/skyline/blob/ftx1/app/src/main/cpp/skyline/os.cpp
https://github.com/skyline-emu/skyline/blob/ftx1/app/src/main/cpp/skyline/os.h
https://github.com/skyline-emu/skyline/tree/ftx1/app/src/main/cpp/skyline/common
https://github.com/skyline-emu/skyline/blob/ftx1/app/src/main/cpp/skyline/common/logger.cpp
https://github.com/skyline-emu/skyline/tree/ftx1/app/src/main/cpp/skyline/loader

]#
  
