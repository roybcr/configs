#!/bin/bash
  text=$1
  THEMES=("")
  count=-1
  
      for char in ${text}
        do
          count=$((count+1))
          THEMES[${count}]="${char}"
       done
      
     echo "${THEMES[*]}"  
  


