#!/bin/bash 

directory="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

for dir in `find $directory -type d -name '*.out'`
do
	echo $dir
	for file in `find $dir -type f -name "H_*.ovf"`		
	do
  		mumax3-convert -gplot $file
	done

	cd $dir
	gnuplot -e "set terminal png size 1280,980 enhanced font 'Helvetica,20'; set output 'B_eff.png'; set grid; plot 'H_eff.gplot' using 1:4"
	gnuplot -e "set terminal png size 1280,980 enhanced font 'Helvetica,20'; set output 'B_demag.png'; set grid; plot 'H_demag.gplot' using 1:4"
	gnuplot -e "set terminal png size 1280,980 enhanced font 'Helvetica,20'; set output 'B_ext.png'; set grid; plot 'H_ext.gplot' using 1:4"
	cd $directory

done

