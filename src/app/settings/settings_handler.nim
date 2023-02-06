#[
  boxedcat - an okzyrox experimental project

  2022-2023

  settings file-handler
]#

import std/[parsecfg, strutils, streams]
import ../../core/boxedcat/util/logger/logger

var 
    settingsLoadFromFile:bool
    configDict:Config

    didLoadSettingsSuccessfully:bool


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


proc createSettings() =
    var hasPreviousSettings:bool

    try:
        let x  = loadConfig("appSettings.ini")
        hasPreviousSettings = true
    except:
        hasPreviousSettings = false
    
    # do something

proc loadSettings():Config = 
    var settingsR:Config

    try:
        settingsR = loadConfig("appSettings.ini")
    except:
        log("An error occured while loading settings, please check your \'appSettings.ini\' config file!", "WARN")

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