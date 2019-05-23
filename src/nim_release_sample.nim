## nim_release_sample is cross-compiling sample project.

import os, strformat, strutils

import nim_release_sample/util

const
  myName* = "foobar taro"
    ## my name.
    ##
    ## See also:
    ## * `fizzbuzz proc <util.html#fizzbuzz,int>`_

proc usage*() =
  ## Print usage of this application.
  echo """
nim_release_sample is a sample executable command.

Usage:
  nim_release_sample [flags] <params...>

Examples:
  nim_release_sample 5

Flags:
  -h, --help    prints this document
"""

when isMainModule:
  for p in commandLineParams():
    case $p
    of "-h", "--help":
      usage()
    else:
      for i in 1..p.`$`.parseInt:
        echo &"{i}:{fizzbuzz(i)}"
