#[
  boxedcat - an okzyrox experimental project

  2022-2023

  logging system
]#

import strutils, times

type Logger = object
    file:File

var loggers = newSeq[Logger]()

proc addLogger*(file:File) = 
    loggers.add Logger(file:file)

#[error levels
DEBUG
INFO
NOTICE
WARNING
ERROR
FATAL
]#

template log*(text: string, level: string) =
  let 
    module = instantiationInfo().filename
    str = "[$# $#][$#] - $#: $#" % [getDateStr(), getClockStr(), module, level, text]
  for logger in loggers:
    logger.file.writeLine str
    logger.file.flushFile