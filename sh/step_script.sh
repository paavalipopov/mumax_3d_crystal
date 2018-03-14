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
	result=${PWD##*/}  
	gnuplot -e "set terminal png size 1280,980 enhanced font 'Helvetica,20'; set output '$result B_eff.png'; set grid; plot 'H_eff.gplot' using 2:5"
	gnuplot -e "set terminal png size 1280,980 enhanced font 'Helvetica,20'; set output '$result B_demag.png'; set grid; plot 'H_demag.gplot' using 2:5"
	gnuplot -e "set terminal png size 1280,980 enhanced font 'Helvetica,20'; set output '$result B_ext.png'; set grid; plot 'H_ext.gplot' using 2:5"
	gnuplot -e "set terminal png size 1280,980 enhanced font 'Helvetica,20'; set output '$result B_ext_full.png'; set size ratio -1; set grid; plot 'H_eff_full.gplot' using 1:2:5 with image"
	gnuplot -e "set terminal png size 1280,980 enhanced font 'Helvetica,20'; set output '$result B_ext_top_ortho.png'; set size ratio -1; set grid; plot 'H_eff_top_ortho.gplot' using 2:3:5 with image"
	gnuplot -e "set terminal png size 1280,980 enhanced font 'Helvetica,20'; set output '$result B_ext_middle_ortho.png'; set size ratio -1; set grid; plot 'H_eff_middle_ortho.gplot' using 2:3:5 with image"
	cd $directory

done

