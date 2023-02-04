
var loaderModuleList = @[
    "BLANK"
]



proc initModulesLoader() = 
    for i in loaderModuleList:
        case i: # todo, add modules and maybe module loading system. if not, then just check if the mods are working through some means
            of "BLANK":
                echo "nothing happened..."




proc loaderInitialize() = 
    echo "Attempting \'loader\' init"
    try:
        initModulesLoader()
    except:
        echo "Failed to load one or more 'loader' modules"
