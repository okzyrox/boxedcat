
var loaderModuleList = @[
    "BLANK"
]



proc initModulesLoader() = 
    for i in loaderModuleList:
        case i:
            of "BLANK":
                echo "nothing happened..."




proc loaderInitialize() = 
    echo "Attempting \'loader\' init"
    try:
        initModulesLoader()
    except:
        echo "Failed to load one or more 'loader' modules"
