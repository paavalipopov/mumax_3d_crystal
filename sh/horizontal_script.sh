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
	gnuplot -e "set terminal png size 1280,980 enhanced font 'Helvetica,20'; set output '$result B_eff.png'; set yrange [0.02:025]; set grid; plot 'H_eff.gplot' using 1:5 with lines"
	gnuplot -e "set terminal png size 1280,980 enhanced font 'Helvetica,20'; set output '$result B_demag.png'; set grid; plot 'H_demag.gplot' using 1:5 with lines"
	gnuplot -e "set terminal png size 1280,980 enhanced font 'Helvetica,20'; set output '$result B_ext.png'; set grid; plot 'H_ext.gplot' using 1:5 with lines"
	gnuplot -e "set terminal png size 1280,980 enhanced font 'Helvetica,20'; set output '$result B_ext_full.png'; set size ratio -1; set cbrange [0.02:025]; set grid; plot 'H_eff_full.gplot' using 1:2:5 with image"
	gnuplot -e "set terminal png size 1280,980 enhanced font 'Helvetica,20'; set output '$result B_ext_ortho.png'; set size ratio -1; set cbrange [0.02:025]; set grid; plot 'H_eff_ortho.gplot' using 2:3:5 with image"
	cd $directory

	

done

for dir in `find $directory -type d -name '*dynamic*'`
do
	for file in `find $dir -type f -name "table.txt"`		
	do
  		mumax3-fft $file
	done

	cd $dir
	result=${PWD##*/}  

	gnuplot -e "set logscale y 10; set terminal png size 1280,980 enhanced font 'Helvetica,20'; set xrange [5e8:7e9]; set output '$result AFR_x_beg.png'; set grid; plot 'table_fft.txt' every ::1 using 1:5 with lines"
	gnuplot -e "set logscale y 10; set terminal png size 1280,980 enhanced font 'Helvetica,20'; set xrange [5e8:7e9]; set output '$result AFR_x_mid.png'; set grid; plot 'table_fft.txt' every ::1 using 1:8 with lines"
	gnuplot -e "set logscale y 10; set terminal png size 1280,980 enhanced font 'Helvetica,20'; set xrange [5e8:7e9]; set output '$result AFR_x_end.png'; set grid; plot 'table_fft.txt' every ::1 using 1:11 with lines"
	gnuplot -e "set logscale y 10; set terminal png size 1280,980 enhanced font 'Helvetica,20'; set xrange [5e8:7e9]; set output '$result AFR_x_all.png'; set grid; plot 'table_fft.txt' every ::1 using 1:5 with lines, 'table_fft.txt' every ::1 using 1:8 with lines, 'table_fft.txt' every ::1 using 1:11 with lines"
	gnuplot -e "set logscale y 10; set terminal png size 1280,980 enhanced font 'Helvetica,20'; set xrange [5e8:7e9]; set output '$result AFR_x_passing.png'; set grid; plot 'table_fft.txt' every ::1 using 1:(column(11)/column(5)) with lines"


	gnuplot -e "set logscale y 10; set terminal png size 1280,980 enhanced font 'Helvetica,20'; set xrange [5e8:7e9]; set output '$result AFR_y_beg.png'; set grid; plot 'table_fft.txt' every ::1 using 1:6 with lines"
	gnuplot -e "set logscale y 10; set terminal png size 1280,980 enhanced font 'Helvetica,20'; set xrange [5e8:7e9]; set output '$result AFR_y_mid.png'; set grid; plot 'table_fft.txt' every ::1 using 1:9 with lines"
	gnuplot -e "set logscale y 10; set terminal png size 1280,980 enhanced font 'Helvetica,20'; set xrange [5e8:7e9]; set output '$result AFR_y_end.png'; set grid; plot 'table_fft.txt' every ::1 using 1:12 with lines"
	gnuplot -e "set logscale y 10; set terminal png size 1280,980 enhanced font 'Helvetica,20'; set xrange [5e8:7e9]; set output '$result AFR_y_all.png'; set grid; plot 'table_fft.txt' every ::1 using 1:6 with lines, 'table_fft.txt' every ::1 using 1:9 with lines, 'table_fft.txt' every ::1 using 1:12 with lines"
	gnuplot -e "set logscale y 10; set terminal png size 1280,980 enhanced font 'Helvetica,20'; set xrange [5e8:7e9]; set output '$result AFR_y_passing.png'; set grid; plot 'table_fft.txt' every ::1 using 1:(column(12)/column(6)) with lines"

	gnuplot -e "set logscale y 10; set terminal png size 1280,980 enhanced font 'Helvetica,20'; set xrange [5e8:7e9]; set output '$result AFR_z_beg.png'; set grid; plot 'table_fft.txt' every ::1 using 1:7 with lines"
	gnuplot -e "set logscale y 10; set terminal png size 1280,980 enhanced font 'Helvetica,20'; set xrange [5e8:7e9]; set output '$result AFR_z_mid.png'; set grid; plot 'table_fft.txt' every ::1 using 1:10 with lines"
	gnuplot -e "set logscale y 10; set terminal png size 1280,980 enhanced font 'Helvetica,20'; set xrange [5e8:7e9]; set output '$result AFR_z_end.png'; set grid; plot 'table_fft.txt' every ::1 using 1:13 with lines"
	gnuplot -e "set logscale y 10; set terminal png size 1280,980 enhanced font 'Helvetica,20'; set xrange [5e8:7e9]; set output '$result AFR_z_all.png'; set grid; plot 'table_fft.txt' every ::1 using 1:7 with lines, 'table_fft.txt' every ::1 using 1:10 with lines, 'table_fft.txt' every ::1 using 1:13 with lines"
	gnuplot -e "set logscale y 10; set terminal png size 1280,980 enhanced font 'Helvetica,20'; set xrange [5e8:7e9]; set output '$result AFR_z_passing.png'; set grid; plot 'table_fft.txt' every ::1 using 1:(column(13)/column(7)) with lines"

	zerofile=$(find $dir -maxdepth 1 -type f -name "zero_m_full.ovf")
	mumax3-convert -omf text $zerofile
	rm $zerofile
	zerofile=$(find $dir -maxdepth 1 -type f -name "zero_m_full.omf")

	for file in `find $dir -maxdepth 1 -type f -name "m_full_zrange*.ovf"`	
	do
  		mumax3-convert -omf text $file
		rm $file
	done

	for file in `find $dir -maxdepth 1 -type f -name "m_full_zrange*.omf"`
	do
		echo "$file"
		echo " "
		~/go/src/magEditor/manipulations $file $zerofile m
		mumax3-convert -gplot $file
	done
	
	
	
	zerofile=$(find $dir -maxdepth 1 -type f -name "zero_m_full_beggining.ovf")
	mumax3-convert -omf text $zerofile
	rm $zerofile

	zerofile=$(find $dir -maxdepth 1 -type f -name "zero_m_full_beggining.omf")
	
	for file in `find $dir -maxdepth 1 -type f -name "m_full_xrange5*.ovf"`	
	do
  		mumax3-convert -omf text $file
		rm $file
	done

	for file in `find $dir -maxdepth 1 -type f -name "m_full_xrange5*.omf"`
	do
		echo "$file"
		echo " "
		~/go/src/magEditor/manipulations $file $zerofile m
		mumax3-convert -gplot $file
	done
	
	
	
	zerofile=$(find $dir -maxdepth 1 -type f -name "zero_m_full_middle.ovf")
	mumax3-convert -omf text $zerofile
	rm $zerofile

	zerofile=$(find $dir -maxdepth 1 -type f -name "zero_m_full_middle.omf")
	
	for file in `find $dir -maxdepth 1 -type f -name "m_full_xrange13*.ovf"`	
	do
  		mumax3-convert -omf text $file
		rm $file
	done

	for file in `find $dir -maxdepth 1 -type f -name "m_full_xrange13*.omf"`
	do
		echo "$file"
		echo " "
		~/go/src/magEditor/manipulations $file $zerofile m
		mumax3-convert -gplot $file
	done



	zerofile=$(find $dir -maxdepth 1 -type f -name "zero_m_full_end.ovf")
	mumax3-convert -omf text $zerofile
	rm $zerofile

	zerofile=$(find $dir -maxdepth 1 -type f -name "zero_m_full_end.omf")
	
	for file in `find $dir -maxdepth 1 -type f -name "m_full_xrange20*.ovf"`	
	do
  		mumax3-convert -omf text $file
		rm $file
	done

	for file in `find $dir -maxdepth 1 -type f -name "m_full_xrange20*.omf"`
	do
		echo "$file"
		echo " "
		~/go/src/magEditor/manipulations $file $zerofile m
		mumax3-convert -gplot $file
	done

	gnuplot -e "set terminal png size 1280,980 enhanced font 'Helvetica,20'; 
	set cbrange [0.01:10000];
	set grid;
	set logscale cb 10;
	do for [i=1:1000] {
	infile = sprintf('m_full_zrange8_%06.0f.gplot',i);
    	outfile = sprintf('$result amp_picture_%03.0f.png',i);
    	set output outfile;
	plot infile using 1:2:(sqrt(column(4)*column(4) + column(6)*column(6))) with image;
	}
	"
	cd $directory



	cd $directory

	
	

done

