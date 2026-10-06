#!/bin/bash
dotfilesDir=$(pwd)

function link_dot_file {
  dest="${HOME}/${1}"
  dateStr=$(date +%Y-%m-%d-%H%M)

  if [ -h ~/${1} ]; then
    # Existing symlink 
    echo "Removing existing symlink: ${dest}"
    rm ${dest} 

  elif [ -f "${dest}" ]; then
    # Existing file
    echo "Backing up existing file: ${dest}"
    mv ${dest}{,.${dateStr}}

  elif [ -d "${dest}" ]; then
    # Existing dir
    echo "Backing up existing dir: ${dest}"
    mv ${dest}{,.${dateStr}}
  fi

  echo "Creating new symlink: ${dest}"
  ln -s ${dotfilesDir}/${1} ${dest}
}

call_if_one_arg() {
  local fn=$1
  shift
  
  if [[ $# -ne 1 ]]; then
    echo "Error: expected exactly 1 argument, got $#." >&2
    usage
    exit 2
  fi
  "$fn" "$1"
}

call_if_one_arg link_dot_file $1
