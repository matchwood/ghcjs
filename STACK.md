    
    git submodule update --init --recursive

make sure you have a global ghc installation (symlink .stack[..] ghc and ghc-pkg to .local/bin/ghc ghc-pkg)
    
    stack install alex happy cabal-install
    ./utils/makePackages.sh
    stack build
    stack exec ghcjs-boot

    stack build --test

We have to install a bunch of packages for the tests.

I've added primitive to the stage1b boot.yaml because it has a patch
Also manually changed the bounds in lib/boot/pkg primitive.cabal to use the base that actually comes with ghc / ghcjs

    (stack exec cabal update)

    stack exec cabal install -- --ghcjs --with-compiler /code/ghcjs/ghcjs/.stack-work/install/x86_64-linux/lts-11.20/8.2.2/bin/ghcjs --with-hc-pkg /code/ghcjs/ghcjs/.stack-work/install/x86_64-linux/lts-11.20/8.2.2/bin/ghcjs-pkg random-1.1 syb-0.7 text-1.2.3.0 parallel-3.2.2.0 QuickCheck-2.10.1 vector-0.12.0.1  stm-2.4.5.0 parsec-3.1.13.0

install ghcjs-boot branch lts-11.20 

     stack exec cabal install -- --ghcjs --with-compiler /code/ghcjs/ghcjs/.stack-work/install/x86_64-linux/lts-11.20/8.2.2/bin/ghcjs --with-hc-pkg /code/ghcjs/ghcjs/.stack-work/install/x86_64-linux/lts-11.20/8.2.2/bin/ghcjs-pkg /path/to/local/ghcjs-base


for building eg old-time 
stack install hsc2hs


Current test failures

ghc/concurrent/t4030.hs (: node, optimization: False) -- process killed after timeout
ghc/codeGen/5129.hs (: node, optimization: True) -- "must throw when given a negative number" (doesn't evaluate error?)



