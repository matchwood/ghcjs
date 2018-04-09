Clone repo and then run
    
    stack build
    stack exec ghcjs-boot -- --dev


To test patches in ghcjs-boot cd into the relevant package directory and run
    
    git apply ../../patches/PACKAGE.patch 

for failing patches use with  --reject flag to apply hunks that are relevant and then go through the rejects fixing things.

To work on patches it is easiest to run the ghcjs-boot executable, and then find the directory where the ghcjs-boot repo has been cloned (somwhere like ~/.ghcjs/VERSION/ghcjs-boot) You can then work on patches directly.

 To run tests after building with stack you must install random, QuickCheck and parsec for ghcjs and ghc. The easiest way I've found to do this is to run

    # install ghc versions - will use the stack snapshot packages
    stack install random QuickCheck parsec 
    # install ghcjs versions
    # replace version numbers for packages with the relevant ones for the stackage resolver snapshot you are using
    stack exec /path/to/cabal install --  --ghcjs --with-compiler /[pathToGhcjsYouArebuilding]/.stack-work/install/[pathForSystemInfoAndCompilerVersion/bin/ghcjs --with-hc-pkg  /[pathToGhcjsYouArebuilding]/.stack-work/install/[pathForSystemInfoAndCompilerVersion/bin/ghcjs-pkg random-1.1 QuickCheck-2.9.2 parsec-3.1.11 

You should then be able to run stack test as normal.

To build source distribution

    stack exec --no-ghc-package-path cabal sdist
