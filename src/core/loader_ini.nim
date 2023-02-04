#[
  boxedcat - an okzyrox experimental project

  2022-2023

  util and func loader
]#


var loaderModuleList = @[
    "BLANK"
]



proc initModulesLoader() = 
    for i in loaderModuleList:
        case i: # todo, add modules and maybe module loading system. if not, then just check if the mods are working through some means
            of "BLANK":
                echo "nothing happened..."




proc core_LoaderInit():string = 
    echo "Attempting \'loader\' init"
    try:
        initModulesLoader()
    except:
        echo "Failed to load one or more 'loader' modules"
        return "0"
    return "1"
