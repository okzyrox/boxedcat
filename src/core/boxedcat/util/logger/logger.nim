#[
  boxedcat - an okzyrox experimental project

  2022-2023

  logging system
]#

import strutils, times

template log*(text: string, level: string) =
  const module = instantiationInfo().filename
  let str = "[$# $#][$#] - $#: $#" % [getDateStr(), getClockStr(), module, level, text]
  echo str