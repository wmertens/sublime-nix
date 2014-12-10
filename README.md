sublime-nix
===========

[Nix](http://nixos.org) syntax highlighting for Sublime Text.

This syntax tries to be complete, and marks illegal code as such.

Unfortunately, the syntax highlighter in Sublime Text does not implement
a full state machine and therefore this is an approximation of the actual
syntax Nix allows. It's a bit looser and will mark things as illegal in corner
cases.

Specifically, it has to guess whether { starts an attribute set or a function
call, and it can't look ahead to the next lines, so it allows both until it's sure.
However, this means that on column 0 the expression end-condition
can match on a , or } and this breaks the syntax highlighting. As soon as it
is sure of one or the other, this no longer applies. So this is only applicable
to empty {} and comma-first function calls on column 0, not a big problem.

Tested against the nixpkgs code and the Nix test suite, it seems to render
those ok.

There is some fun code in here, approximating a proper parser by recursing
into rules with end conditions matching end of expression.