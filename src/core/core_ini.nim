
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
            


proc coreInitialize() =
    echo "Attempting \'core\' init"
    try:
        initModulesCore()
    except:
        echo "Failed to load one or more 'core' modules"
