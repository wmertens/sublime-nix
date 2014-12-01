sublime-nix
===========

[Nix](http://nixos.org) syntax highlighting for Sublime Text.

This syntax tries to be complete, and marks illegal code as such.

Unfortunately, the syntax highlighter in Sublime Text does not implement
a full state machine and therefore this is an approximation of the actual
syntax Nix allows. It's a bit looser and will mark things as illegal in corner
cases.

Tested against the nixpkgs code and the Nix test suite, it seems to render
those ok.