To run tests after building with stack you must install random, QuickCheck and parsec for ghcjs and ghc. The easiest way I've found to do this is to run

    # install ghc versions - will use the stack snapshot packages
    stack install random QuickCheck parsec 
    # install ghcjs versions
    # replace version numbers for packages with the relevant ones for the stackage resolver snapshot you are using
    stack exec /path/to/cabal install --  --ghcjs --with-compiler /[pathToGhcjsYouArebuilding]/.stack-work/install/[pathForSystemInfoAndCompilerVersion/bin/ghcjs --with-hc-pkg  /[pathToGhcjsYouArebuilding]/.stack-work/install/[pathForSystemInfoAndCompilerVersion/bin/ghcjs-pkg random-1.1 QuickCheck-2.9.2 parsec-3.1.11 

You should then be able to run stack test as normal