#!/bin/bash
basepath=$1

PATH="$PATH:.:/home/user/.local/share/bob/nvim-bin:/home/user/.cargo/bin"

$basepath/local_files.sh

alias coding-style=$basepath/epitech_coding-style.sh
alias banana=$basepath/epitech_norminette.sh
alias header=$basepath/epitech_header.sh
alias fcreate=$basepath/epitech_file_create.sh
alias gidentity=$basepath/git_identity.sh
alias norminette="python3 -m norminette"
