# This is just an example to get you started. A typical binary package
# uses this file as the main entry point of the application.

include "core/core_ini.nim"
include "core/loader_ini.nim"

when isMainModule:
  echo("Hello, World!")
  coreInitialize()
  loaderInitialize()

#[
https://github.com/skyline-emu/skyline/tree/ftx1/app/src/main/cpp/skyline
https://github.com/skyline-emu/skyline/blob/ftx1/app/src/main/cpp/skyline/os.cpp
https://github.com/skyline-emu/skyline/blob/ftx1/app/src/main/cpp/skyline/os.h
https://github.com/skyline-emu/skyline/tree/ftx1/app/src/main/cpp/skyline/common
https://github.com/skyline-emu/skyline/blob/ftx1/app/src/main/cpp/skyline/common/logger.cpp
https://github.com/skyline-emu/skyline/tree/ftx1/app/src/main/cpp/skyline/loader

]#
  