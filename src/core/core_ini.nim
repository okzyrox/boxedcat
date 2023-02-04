#[
  boxedcat - an okzyrox experimental project

  2022-2023

  module loader for core things
]#
var coreModuleList = @[
    "BLANK"
]


proc initModulesCore() = 
    for i in coreModuleList:
        case i:
            of "logger":
                #include "boxedcat/util/logger/logger.nim"
                echo 1
            of "BLANK":
                echo "nothing happened..."
            


proc core_CoreInit():string =
    echo "Attempting \'core\' init"
    try:
        initModulesCore()
    except:
        echo "Failed to load one or more 'core' modules"
        return "0"

    return "1"
