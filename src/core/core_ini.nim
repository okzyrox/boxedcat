#[
  boxedcat - an okzyrox experimental project

  2022-2023

  module loader for core things
]#
import boxedcat/util/logger/logger


var coreModuleList = @[
    "BLANK"
]


proc initModulesCore() = 
    for i in coreModuleList:
        case i:
            of "BLANK":
                echo "nothing happened..."
            


proc core_CoreInit():string =
    log("Attempting \'core\' init", "INFO")
    try:
        initModulesCore()
    except:
        log("Failed to load one or more 'core' modules", "ERROR")
        return "0"

    return "1"
