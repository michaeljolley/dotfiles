#!/bin/bash

############################
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=~/dotfiles              # dotfiles directory
ZSH="$HOME/.oh-my-zsh"      # oh-my-zsh installation directory

##########


# create symlinks from the homedir to any files in the ~/dotfiles directory
for file in `find $dir/.dotfiles`; do
    filename=$(basename "$file")

    if [ -f "$filename" ]; then
        echo "File $filename already exists in home directory. Deleting."
        rm "$filename"
    fi

    echo "Creating symlink to $filename in home directory."
    ln -s $dir/.dotfiles/$filename ~/$filename
done

# create symlinks from the oh-my-posh themes directory to any files in the ~/theme directory
for file in `find $dir/theme`; do
    filename=$(basename "$file")

    if [ -f "$ZSH/custom/themes/$filename" ]; then
        echo "File $filename already exists in theme directory. Deleting."
        rm "$filename"
    fi

    echo "Creating symlink to $filename in theme directory."
    ln -s $dir/theme/$filename $ZSH/custom/themes/$filename
done