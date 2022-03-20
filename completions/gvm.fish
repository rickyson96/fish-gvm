#!/usr/bin/env fish

set --local commands "version get use diff help implode install uninstall cross linkthis list listall alias pkgset pkgenv"

complete --command gvm --no-files

set --local main "not __fish_seen_subcommand_from $commands"
complete --command gvm --condition $main --arguments version --description 'print the gvm version number'
complete --command gvm --condition $main --arguments get --description 'gets the latest code (for debugging)'
complete --command gvm --condition $main --arguments use --description 'select a go version to use'
complete --command gvm --condition $main --arguments diff --description 'view changes to Go root'
complete --command gvm --condition $main --arguments help --description 'display this usage text'
complete --command gvm --condition $main --arguments implode --description 'completely remove gvm'
complete --command gvm --condition $main --arguments install --description 'install go versions'
complete --command gvm --condition $main --arguments uninstall --description 'uninstall go versions'
complete --command gvm --condition $main --arguments cross --description 'install go cross compilers'
complete --command gvm --condition $main --arguments linkthis --description 'link this directory into GOPATH'
complete --command gvm --condition $main --arguments list --description 'list installed go versions'
complete --command gvm --condition $main --arguments listall --description 'list available versions'
complete --command gvm --condition $main --arguments alias --description 'manage go version aliases'
complete --command gvm --condition $main --arguments pkgset --description 'manage go packages sets'
complete --command gvm --condition $main --arguments pkgenv --description 'edit the environment for a package set'

set --local seen __fish_seen_subcommand_from

complete --command gvm --condition "$seen use" --exclusive --arguments '(__fish_gvm_get_list)'
complete --command gvm --condition "$seen use" -l default --description 'set default (permanent) version'
complete --command gvm --condition "$seen use" -s h -l help --description 'Display help message.'

complete --command gvm --condition "$seen install" --exclusive --arguments '(__fish_gvm_get_list_all)'
complete --command gvm --condition "$seen install" -s n -l name --description 'Override the default name for this version'
complete --command gvm --condition "$seen install" -s h -l help --description 'Display help message.'
complete --command gvm --condition "$seen install" -s s -l source --description 'Install Go from specified source.'
complete --command gvm --condition "$seen install" -s pb -l with-protobuf --description 'Install Go protocol buffers.'
complete --command gvm --condition "$seen install" -s b -l with-build-tools --description 'Install package build tools.'
complete --command gvm --condition "$seen install" -s B -l binary --description 'Only install from binary.'
complete --command gvm --condition "$seen install" -l prefer-binary --description 'Attempt a binary install, falling back to source.'

complete --command gvm --condition "$seen linkthis" -s f -l force --description 'Remove existing destination and create symlink again'
complete --command gvm --condition "$seen linkthis" -s h -l help --description 'Display help message.'

complete --command gvm --condition "$seen listall" -s a -l all --description 'List all tags.'
complete --command gvm --condition "$seen listall" -s h -l help --description 'Display help message.'

complete --command gvm --condition "$seen pkgenv" -s o -l output --description 'Write content to stdout'
complete --command gvm --condition "$seen pkgenv" -s h -l help --description 'Display help message.'
