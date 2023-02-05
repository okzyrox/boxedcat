#[
  boxedcat - an okzyrox experimental project

  2022-2023

  settings file-handler
]#

import std/[parsecfg, strutils, streams]
import ../../core/boxedcat/util/logger/logger

var settingsLoadFromFile:bool
var configDict:Config

try:
    let settingsFile = loadConfig("appSettings.ini") # bad but ok
    settingsLoadFromFile = true
except:
    settingsLoadFromFile = false

if settingsLoadFromFile == false:
    configDict = newConfig()
    #settings
    configDict.setSectionKey("General", "VSync", "false")
    #endsettings
    configDict.writeConfig("appSettings.ini")
else:
    configDict = loadConfig("appSettings.ini")

proc getConfig*():Config =
    return configDict