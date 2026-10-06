#!/bin/bash

function cdd {
  if [[ "$#" -gt 0 ]]
  then
	cd $(fd --type d --max-depth $1 | fzf)
  else
	cd $(fd --type d --max-depth 5 | fzf)
  fi
}


