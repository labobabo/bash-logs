
#!/bin/bash

echo "Enter path folder or file with log links:  "
read path_with_log_links; echo

echo "Enter the path with new name file to which the log lines will be copied:  "
read path_with_new_file; echo

touch $path_with_new_file


function Search_log
{
  while read y
  do
    if [[ $y == [A-Z][a-z][a-z]??[0-9]?[0-9][0-9]':'[0-9][0-9]':'[0-9][0-9]* ]]
      then echo $y >> $path_with_new_file
      echo $y
      fi
      
  done < $1
  
}


function Scan_folder
{
  if [ -f "$1" ]
  then
    Search_log $1
  
  elif [ -d "$1" ] 
  then 
    for next_file in $1/*
    do
      #echo $next_file
      Scan_folder $next_file
      
    done
  fi


}

Scan_folder $path_with_log_links

echo
echo "Program finish"

