# This is just an example to get you started. A typical binary package
# uses this file as the main entry point of the application.

include "core/core_ini.nim"
include "core/loader_ini.nim"

when isMainModule:
  echo("Hello, World!")
  core_initialize()
  loader_initialize()
  