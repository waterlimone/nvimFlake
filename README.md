# Overview

Small NixVim setup flakified. Right now it takes inputs from the flake building it and uses them for NixD language support for general
Nix and HomeManager Functions. I has multi language supports and some quality of life plugins inside of it. The point is for it to be dropped
into a nix develop -i environment passing in things like HOME for GIT integration with the system so you can isolate your text editor in your devshell
preventing most leaks. Currently it mostly works with the exception of NixD getting hung up because it doesn't know where that is in a Devshell.

# Notes

Some of this can be accomplished with another Nixvim setup I found online that uses flakeparts. This was mostly to experiment with Nix and how inheritance works
and so I could understand my setup more. Also there are less dependencies. I am on 25.11 and my friend used flakeparts unstable which seemed to cause issues that
they had to silence so I am avoiding that for now despite the features. Everything that can be accomplished with flakeparts should be able to be accomplished
with vanilla Nix.

# TODO

Either allow it to not engage NixD at all in devshell setup or make it so it brings its own NixD with it so it doesn't hang when it is in devshell mode.