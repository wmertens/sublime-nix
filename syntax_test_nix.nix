# SYNTAX TEST "Packages/Nix/nix.tmLanguage"
{
  # keywords inside identifiers (#12)
  a = rec';
#     ^^^^ variable.parameter.name.nix
  a = x-rec;
#     ^^^^^ variable.parameter.name.nix
  a = let-x;
#     ^^^^^ variable.parameter.name.nix
  a = if x then a-else else b-then;
#     ^^ keyword.other.nix
#               ^^^^^^ variable.parameter.name.nix
#                      ^^^^ keyword.other.nix
#                           ^^^^^^ variable.parameter.name.nix
  a = pkgs.or-tools;
#          ^^^^^^^^ variable.parameter.name.nix
  a = b.c or d;
#         ^^ keyword.operator.nix
  a = rec { x = 1; };
#     ^^^ keyword.other.nix

  # paths with interpolation (#15)
  a = ./..;
#     ^^^^ string.unquoted.path.nix
  a = ./${a}..;
#     ^^ string.unquoted.path.nix
#       ^^ punctuation.section.embedded.begin.nix
#           ^^ string.unquoted.path.nix
  a = ../a/${a}/a;
#     ^^^^^ string.unquoted.path.nix
#              ^^ string.unquoted.path.nix
#                ^ punctuation.terminator.bind.nix
  a = ~/${a};
#     ^^ string.unquoted.path.nix
  a = x / y;
#       ^ keyword.operator.nix
  a = x//y;
#      ^^ keyword.operator.nix
}
