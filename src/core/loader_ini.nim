#[
  boxedcat - an okzyrox experimental project

  2022-2023

  util and func loader
]#
import boxedcat/util/logger/logger


var loaderModuleList = @[
    "BLANK"
]



proc initModulesLoader() = 
    for i in loaderModuleList:
        case i: # todo, add modules and maybe module loading system. if not, then just check if the mods are working through some means
            of "BLANK":
                log("but nothing happened...", "NOTICE")



proc core_LoaderInit():string = 
    log("Attempting \'loader\' init", "INFO") 
    try:
        initModulesLoader()
    except:
        log("Failed to load one or more \'loader\' modules", "ERROR")
        return "0"
    return "1"
