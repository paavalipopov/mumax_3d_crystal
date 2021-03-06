#!/bin/bash   

directory="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

for dir in `find $directory -type d -name '*.out'`
do
	cd $dir
	result=${PWD##*/}  
	cd "./$result width amp"
	gnuplot -e "set terminal png size 1280,980 enhanced font 'Helvetica,20'; 
	set cbrange [0:0.25];
	set grid;
	set logscale cb 10;
	do for [i=1:500] {
	infile = sprintf('B_eff_yrange16_%06.0f.gplot',i);
    	outfile = sprintf('$result amp_picture_%03.0f.png',i);
    	set output outfile;
	plot infile using 1:2:(sqrt(column(4)*column(4) + column(6)*column(6))) with image;
	}
	"
	
	cd $directory


done
