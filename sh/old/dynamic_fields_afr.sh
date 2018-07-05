#!/bin/bash   

directory="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

for dir in `find $directory -type d -name '*.out'`
do
	for file in `find $dir -type f -name "H_*.ovf"`		
	do
  		mumax3-convert -gplot $file
	done
	
	for file in `find $dir -type f -name "table.txt"`		
	do
  		mumax3-fft $file
	done

	#set xrange [5e8:10e9]; 
	cd $dir
	result=${PWD##*/}  
	mkdir "$result fields" 
	gnuplot -e "set terminal png size 1280,980 enhanced font 'Helvetica,20'; set output './$result fields/$result B_eff.png'; set grid; plot 'H_eff.gplot' using 2:5"
	gnuplot -e "set terminal png size 1280,980 enhanced font 'Helvetica,20'; set output './$result fields/$result B_demag.png'; set grid; plot 'H_demag.gplot' using 2:5"
	gnuplot -e "set terminal png size 1280,980 enhanced font 'Helvetica,20'; set output './$result fields/$result B_ext.png'; set grid; plot 'H_ext.gplot' using 2:5"
	gnuplot -e "set terminal png size 1280,980 enhanced font 'Helvetica,20'; set output './$result fields/$result B_ext_full.png'; set size ratio -1; set grid; plot 'H_eff_full.gplot' using 1:2:5 with image"
	gnuplot -e "set terminal png size 1280,980 enhanced font 'Helvetica,20'; set output './$result fields/$result B_ext_top_ortho.png'; set size ratio -1; set grid; plot 'H_eff_top_ortho.gplot' using 2:3:5 with image"
	gnuplot -e "set terminal png size 1280,980 enhanced font 'Helvetica,20'; set output './$result fields/$result B_ext_middle_ortho.png'; set size ratio -1; set grid; plot 'H_eff_middle_ortho.gplot' using 2:3:5 with image"

	mkdir "$result afr" 

	gnuplot -e "set logscale y 10; set terminal png size 1280,980 enhanced font 'Helvetica,20'; set xrange [5e8:10e9]; set output './$result afr/$result AFR_x_0_5.png'; set grid; plot 'table_fft.txt' every ::1 using 1:5 with lines"
	gnuplot -e "set logscale y 10; set terminal png size 1280,980 enhanced font 'Helvetica,20'; set xrange [5e8:10e9]; set output './$result afr/$result AFR_x_1_5.png'; set grid; plot 'table_fft.txt' every ::1 using 1:8 with lines"
	gnuplot -e "set logscale y 10; set terminal png size 1280,980 enhanced font 'Helvetica,20'; set xrange [5e8:10e9]; set output './$result afr/$result AFR_x_2_5.png'; set grid; plot 'table_fft.txt' every ::1 using 1:11 with lines"
	gnuplot -e "set logscale y 10; set terminal png size 1280,980 enhanced font 'Helvetica,20'; set xrange [5e8:10e9]; set output './$result afr/$result AFR_x_3_5.png'; set grid; plot 'table_fft.txt' every ::1 using 1:14 with lines"
	gnuplot -e "set logscale y 10; set terminal png size 1280,980 enhanced font 'Helvetica,20'; set xrange [5e8:10e9]; set output './$result afr/$result AFR_x_4_5.png'; set grid; plot 'table_fft.txt' every ::1 using 1:17 with lines"
	gnuplot -e "set logscale y 10; set terminal png size 1280,980 enhanced font 'Helvetica,20'; set xrange [5e8:10e9]; set output './$result afr/$result AFR_x_5_5.png'; set grid; plot 'table_fft.txt' every ::1 using 1:20 with lines"
	gnuplot -e "set logscale y 10; set terminal png size 1280,980 enhanced font 'Helvetica,20'; set xrange [5e8:10e9]; set output '$./$result afr/result AFR_x_all.png'; set grid; plot 'table_fft.txt' every ::1 using 1:5 with lines, 'table_fft.txt' every ::1 using 1:8 with lines, 'table_fft.txt' every ::1 using 1:11 with lines, 'table_fft.txt' every ::1 using 1:14 with lines, 'table_fft.txt' every ::1 using 1:17 with lines, 'table_fft.txt' every ::1 using 1:20 with lines"
	gnuplot -e "set logscale y 10; set terminal png size 1280,980 enhanced font 'Helvetica,20'; set xrange [5e8:10e9]; set output './$result afr/$result AFR_x_passing.png'; set grid; plot 'table_fft.txt' every ::1 using 1:(column(14)/column(11)) with lines"


	gnuplot -e "set logscale y 10; set terminal png size 1280,980 enhanced font 'Helvetica,20'; set xrange [5e8:10e9]; set output './$result afr/$result AFR_y_0_5.png'; set grid; plot 'table_fft.txt' every ::1 using 1:6 with lines"
	gnuplot -e "set logscale y 10; set terminal png size 1280,980 enhanced font 'Helvetica,20'; set xrange [5e8:10e9]; set output './$result afr/$result AFR_y_1_5.png'; set grid; plot 'table_fft.txt' every ::1 using 1:9 with lines"
	gnuplot -e "set logscale y 10; set terminal png size 1280,980 enhanced font 'Helvetica,20'; set xrange [5e8:10e9]; set output './$result afr/$result AFR_y_2_5.png'; set grid; plot 'table_fft.txt' every ::1 using 1:12 with lines"
	gnuplot -e "set logscale y 10; set terminal png size 1280,980 enhanced font 'Helvetica,20'; set xrange [5e8:10e9]; set output './$result afr/$result AFR_y_3_5.png'; set grid; plot 'table_fft.txt' every ::1 using 1:15 with lines"
	gnuplot -e "set logscale y 10; set terminal png size 1280,980 enhanced font 'Helvetica,20'; set xrange [5e8:10e9]; set output './$result afr/$result AFR_y_4_5.png'; set grid; plot 'table_fft.txt' every ::1 using 1:18 with lines"
	gnuplot -e "set logscale y 10; set terminal png size 1280,980 enhanced font 'Helvetica,20'; set xrange [5e8:10e9]; set output './$result afr/$result AFR_y_5_5.png'; set grid; plot 'table_fft.txt' every ::1 using 1:21 with lines"
	gnuplot -e "set logscale y 10; set terminal png size 1280,980 enhanced font 'Helvetica,20'; set xrange [5e8:10e9]; set output './$result afr/$result AFR_y_all.png'; set grid; plot 'table_fft.txt' every ::1 using 1:6 with lines, 'table_fft.txt' every ::1 using 1:9 with lines, 'table_fft.txt' every ::1 using 1:12 with lines, 'table_fft.txt' every ::1 using 1:15 with lines, 'table_fft.txt' every ::1 using 1:18 with lines, 'table_fft.txt' every ::1 using 1:21 with lines"
	gnuplot -e "set logscale y 10; set terminal png size 1280,980 enhanced font 'Helvetica,20'; set xrange [5e8:10e9]; set output './$result afr/$result AFR_y_passing.png'; set grid; plot 'table_fft.txt' every ::1 using 1:(column(15)/column(12)) with lines"

	gnuplot -e "set logscale y 10; set terminal png size 1280,980 enhanced font 'Helvetica,20'; set xrange [5e8:10e9]; set output './$result afr/$result AFR_z_0_5.png'; set grid; plot 'table_fft.txt' every ::1 using 1:7 with lines"
	gnuplot -e "set logscale y 10; set terminal png size 1280,980 enhanced font 'Helvetica,20'; set xrange [5e8:10e9]; set output './$result afr/$result AFR_z_1_5.png'; set grid; plot 'table_fft.txt' every ::1 using 1:10 with lines"
	gnuplot -e "set logscale y 10; set terminal png size 1280,980 enhanced font 'Helvetica,20'; set xrange [5e8:10e9]; set output './$result afr/$result AFR_z_2_5.png'; set grid; plot 'table_fft.txt' every ::1 using 1:13 with lines"
	gnuplot -e "set logscale y 10; set terminal png size 1280,980 enhanced font 'Helvetica,20'; set xrange [5e8:10e9]; set output './$result afr/$result AFR_z_3_5.png'; set grid; plot 'table_fft.txt' every ::1 using 1:16 with lines"
	gnuplot -e "set logscale y 10; set terminal png size 1280,980 enhanced font 'Helvetica,20'; set xrange [5e8:10e9]; set output './$result afr/$result AFR_z_4_5.png'; set grid; plot 'table_fft.txt' every ::1 using 1:19 with lines"
	gnuplot -e "set logscale y 10; set terminal png size 1280,980 enhanced font 'Helvetica,20'; set xrange [5e8:10e9]; set output './$result afr/$result AFR_z_5_5.png'; set grid; plot 'table_fft.txt' every ::1 using 1:22 with lines"
	gnuplot -e "set logscale y 10; set terminal png size 1280,980 enhanced font 'Helvetica,20'; set xrange [5e8:10e9]; set output './$result afr/$result AFR_z_all.png'; set grid; plot 'table_fft.txt' every ::1 using 1:7 with lines, 'table_fft.txt' every ::1 using 1:10 with lines, 'table_fft.txt' every ::1 using 1:13 with lines, 'table_fft.txt' every ::1 using 1:16 with lines, 'table_fft.txt' every ::1 using 1:19 with lines, 'table_fft.txt' every ::1 using 1:22 with lines"
	gnuplot -e "set logscale y 10; set terminal png size 1280,980 enhanced font 'Helvetica,20'; set xrange [5e8:10e9]; set output './$result afr/$result AFR_z_passing.png'; set grid; plot 'table_fft.txt' every ::1 using 1:(column(16)/column(13)) with lines"

	cd $directory


done
