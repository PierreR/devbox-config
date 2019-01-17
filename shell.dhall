{- HELP
Configuration file for the cicd-shell
  loginId  : Your Active directory id
  defaultStack : Stack to use by default when none is specified in the command line
-}

{ loginId =
    env:LOGINID as Text
, defaultStacks =
    [ "cicd", "ci", "elk"]
}
