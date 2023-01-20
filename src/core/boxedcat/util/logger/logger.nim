#include std/logging # this aint working
#
# "Error: 'import' is only allowed at top level"
# import just doesnt work like at all
# include bypasses this, then errors in lib/pure/logging.nim (145,1)
#

#var consoleLog = newConsoleLogger(fmtStr="[$time] - $levelname: ")
#var fileLog = newFileLogger("logs/main.log", levelThreshold=lvlAll)

#addHandler(consoleLog)
#addHandler(fileLog)