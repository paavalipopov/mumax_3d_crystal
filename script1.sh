#!/bin/bash   
      

for file in `find "./" -type f -name "H_*.ovf"`	
do
  	mumax3-convert -gplot $file
done

