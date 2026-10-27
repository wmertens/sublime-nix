# SYNTAX TEST "Packages/Nix/nix.tmLanguage"
{
  # comments
  # TODO: line comment
# ^^^^^^^^^^^^^^^^^^^^ comment.line.number-sign.nix
#   ^^^^ markup.bold.comment.nix
  /* block comment */
# ^^^^^^^^^^^^^^^^^^^ comment.block.nix
  /*
    FIXME: remarks are highlighted after the first line
#   ^^^^^ markup.bold.comment.nix
  */

  # numbers and constants
  a = 42;
#     ^^ constant.numeric.nix
  a = [ true false null ];
#       ^^^^ constant.language.nix
#            ^^^^^ constant.language.nix
#                  ^^^^ constant.language.nix
  a = builtins.length x;
#     ^^^^^^^^ constant.language.nix
#             ^ keyword.operator.nix
  a = import ./x.nix { };
#     ^^^^^^ support.function.nix
  a = map toString (throw "x");
#     ^^^ support.function.nix
#         ^^^^^^^^ support.function.nix
#                   ^^^^^ support.function.nix

  # strings
  a = "a\n\"${b}c";
#     ^ punctuation.definition.string.double.start.nix
#      ^ string.quoted.double.nix
#       ^^ constant.character.escape.nix
#         ^^ constant.character.escape.nix
#           ^^ punctuation.section.embedded.begin.nix
#             ^ variable.parameter.name.nix
#              ^ punctuation.section.embedded.end.nix
#                ^ punctuation.definition.string.double.end.nix
  a = "\${x}";
#      ^^ constant.character.escape.nix
#        ^^^ string.quoted.double.nix
  a = '' x ''${y} ''' ''\n ${z} '';
#     ^^ punctuation.definition.string.other.start.nix
#        ^ string.quoted.other.nix
#          ^^^ constant.character.escape.nix
#             ^^^ string.quoted.other.nix
#                 ^^^ constant.character.escape.nix
#                     ^^^^ constant.character.escape.nix
#                          ^^ punctuation.section.embedded.begin.nix
#                               ^^ punctuation.definition.string.other.end.nix
  a = ''
    multi-line ${x}
  '';
# ^^ punctuation.definition.string.other.end.nix

  # paths, search paths and URLs
  a = ./a/b.nix;
#     ^^^^^^^^^ string.unquoted.path.nix
  a = ../..;
#     ^^^^^ string.unquoted.path.nix
  a = /etc/hosts;
#     ^^^^^^^^^^ string.unquoted.path.nix
  a = ~/x;
#     ^^^ string.unquoted.path.nix
  a = a/b;
#     ^^^ string.unquoted.path.nix
  a = ./${a}..;
#     ^^ string.unquoted.path.nix
#       ^^ punctuation.section.embedded.begin.nix
#           ^^ string.unquoted.path.nix
  a = ../a/${a}/a;
#     ^^^^^ string.unquoted.path.nix
#       ^^ string.unquoted.path.nix
#                ^ punctuation.terminator.bind.nix
  a = ~/${a};
#     ^^ string.unquoted.path.nix
  a = ./a + "/b";
#         ^ keyword.operator.nix
  a = <nixpkgs>;
#     ^^^^^^^^^ string.unquoted.spath.nix
  a = <nixpkgs/lib>;
#     ^^^^^^^^^^^^^ string.unquoted.spath.nix
  a = https://nixos.org/x?y=1;
#     ^^^^^^^^^^^^^^^^^^^^^^^ string.unquoted.url.nix

  # operators
  a = b + c - d * e / f;
#       ^ keyword.operator.nix
#           ^ keyword.operator.nix
#               ^ keyword.operator.nix
#                   ^ keyword.operator.nix
  a = b ++ c // d;
#       ^^ keyword.operator.nix
#            ^^ keyword.operator.nix
  a = b == c && d != e || f -> g;
#       ^^ keyword.operator.nix
#            ^^ keyword.operator.nix
#                 ^^ keyword.operator.nix
#                      ^^ keyword.operator.nix
#                           ^^ keyword.operator.nix
  a = b < c && b <= c && b > c && b >= c;
#       ^ keyword.operator.nix
#                ^^ keyword.operator.nix
#                          ^ keyword.operator.nix
#                                   ^^ keyword.operator.nix
  a = b ? c;
#       ^ keyword.operator.nix
  a = b.c.d or e;
#      ^ keyword.operator.nix
#           ^^ keyword.operator.nix
  a = b.${c}.d;
#       ^^ punctuation.section.embedded.begin.nix
  a = b."c d";
#        ^^^ string.quoted.double.nix
  a = b |> f;
#       ^^ keyword.operator.nix
  a = f <| b;
#       ^^ keyword.operator.nix
  a = !b;
#     ^ keyword.operator.unary.nix
  a = -b;
#     ^ keyword.operator.unary.nix
  a = x / y;
#       ^ keyword.operator.nix
  a = x//y;
#      ^^ keyword.operator.nix

  # lists, parentheses and function application
  a = [ 1 (f x) "s" ];
#     ^ punctuation.definition.list.nix
#         ^ punctuation.definition.expression.nix
#          ^ variable.parameter.name.nix
#            ^ variable.parameter.name.nix
#             ^ punctuation.definition.expression.nix
#                   ^ punctuation.definition.list.nix

  # attribute sets
  a.b."c d".${e} = 1;
# ^ entity.other.attribute-name.multipart.nix
#   ^ entity.other.attribute-name.multipart.nix
#      ^^^ string.quoted.double.nix
#           ^^ punctuation.section.embedded.begin.nix
#                ^ keyword.operator.bind.nix
#                   ^ punctuation.terminator.bind.nix
  inherit a b;
# ^^^^^^^ keyword.other.inherit.nix
#           ^ entity.other.attribute-name.single.nix
#            ^ punctuation.terminator.inherit.nix
  inherit (s) c;
#         ^ punctuation.section.function.arguments.nix
#          ^ variable.parameter.name.nix
#             ^ entity.other.attribute-name.single.nix
  a = rec { x = 1; y = x; };
#     ^^^ keyword.other.nix
#         ^ punctuation.definition.attrset.nix
#                  ^ entity.other.attribute-name.multipart.nix
#                         ^ punctuation.definition.attrset.nix
  a = {
#     ^ punctuation.definition.attrset-or-function.nix
    ${k} = 1;
#   ^^ punctuation.section.embedded.begin.nix
#        ^ keyword.operator.bind.nix
  };
# ^ punctuation.definition.attrset.nix
  a = { };
#     ^ punctuation.definition.attrset.nix

  # let, if, with, assert
  a = let x = 1; inherit (y) z; in x;
#     ^^^ keyword.other.nix
#         ^ entity.other.attribute-name.multipart.nix
#                ^^^^^^^ keyword.other.inherit.nix
#                               ^^ keyword.other.nix
  a = if b then c else d;
#     ^^ keyword.other.nix
#          ^^^^ keyword.other.nix
#                 ^^^^ keyword.other.nix
  a = with b; c;
#     ^^^^ keyword.other.nix
  a = assert b; c;
#     ^^^^^^ keyword.other.nix

  # functions
  a = x: x;
#     ^ variable.parameter.function.4.nix
#      ^ punctuation.definition.function.nix
  a = x: y: x;
#        ^ variable.parameter.function.4.nix
  a = { b, c ? 1, ... }: b;
#     ^ punctuation.definition.entity.function.2.nix
#       ^ variable.parameter.function.1.nix
#        ^ keyword.operator.nix
#            ^ keyword.operator.nix
#                 ^^^ keyword.operator.nix
#                     ^ punctuation.definition.entity.function.nix
  a = { b ? { }, c /* d */ }: b;
#                ^ variable.parameter.function.1.nix
#                  ^^^^^^^ comment.block.nix
  a = args@{ b }: b;
#     ^^^^ variable.parameter.function.4.nix
#            ^ variable.parameter.function.1.nix
  a = { b }@args: b;
#       ^ variable.parameter.function.1.nix
#           ^^^^ variable.parameter.function.3.nix
  a = { }: 1;
#     ^ punctuation.definition.entity.function.2.nix
#        ^ punctuation.definition.function.nix
  a = {
#     ^ punctuation.definition.attrset-or-function.nix
    b,
#   ^ variable.parameter.function.1.nix
    c ? 2,
#   ^ variable.parameter.function.1.nix
    ...
#   ^^^ keyword.operator.nix
  }: b;
# ^ punctuation.definition.entity.function.nix
#  ^ punctuation.definition.function.nix

  # keywords are not recognised inside identifiers (#12)
  a = rec';
#     ^^^^ variable.parameter.name.nix
  a = x-rec;
#     ^^^^^ variable.parameter.name.nix
  a = let-x + in-x + inherit-x + or-x;
#     ^^^^^ variable.parameter.name.nix
#             ^^^^ variable.parameter.name.nix
#                    ^^^^^^^^^ variable.parameter.name.nix
#                                ^^^^ variable.parameter.name.nix
  a = if x then a-else else b-then;
#               ^^^^^^ variable.parameter.name.nix
#                           ^^^^^^ variable.parameter.name.nix
  a = pkgs.or-tools;
#          ^^^^^^^^ variable.parameter.name.nix

  # invalid code
  a = %;
#     ^ invalid.illegal
  a = { let = 1; };
#       ^^^ invalid.illegal.reserved.nix
}
