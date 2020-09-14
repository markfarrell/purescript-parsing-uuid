{-
Welcome to a Spago project!
You can edit this file as you like.
-}
{ name = "purescript-parsing-uuid"
, dependencies = [ "console", "effect", "psci-support", "parsing", "parsing-expect", "parsing-repetition", "parsing-hexadecimal" ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
