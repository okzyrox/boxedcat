#[
  boxedcat - an okzyrox experimental project

  2022-2023

  settings file-handler
]#

import std/[parsecfg, strutils, streams]
import ../../core/boxedcat/util/logger/logger

var settingsLoadFromFile:bool
var configDict:Config


proc checkSettings() =
    var settingsList = @[
        [
            "General", "VSync"
        ],
        [
            "General", "Expand Memory Buffer"
        ]
    ]
    # do later because this is hella painful to write and not efficient 


try:
    let settingsFile = loadConfig("appSettings.ini") # bad but ok

    try:
        checkSettings()
    except:
        log("An error occurred while checking settings", "WARN")

    configDict = loadConfig("appSettings.Ini")
except:
    configDict = newConfig()
    #settings
    configDict.setSectionKey("General", "VSync", "false")
    #endsettings
    configDict.writeConfig("appSettings.ini")



proc getConfig*():Config =
    return configDict