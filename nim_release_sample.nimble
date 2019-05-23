# Package

version       = "0.1.0"
author        = "jiro4989"
description   = "A new awesome nimble package"
license       = "MIT"
srcDir        = "src"
bin           = @["nim_release_sample"]


# Dependencies

requires "nim >= 0.19.4"

task docs, "Generate documents":
  exec "nimble doc src/nim_release_sample.nim -o:docs/nim_release_sample.html"
  exec "nimble doc src/nim_release_sample/util.nim -o:docs/util.html"