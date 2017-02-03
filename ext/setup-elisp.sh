#!/usr/bin/env bash

source VARS

echo "Setting up ELisp environment"

case "$OSTYPE" in
    linux*)
        if is-arch; then
            sudo pacman --needed --noconfirm -S clisp
        else
            echo "..."
            exit 1
        fi
        ;;
esac

