#!/bin/bash   

directory="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

for dir in `find $directory -type d -name '*.out'`
do

	zerofile=$(find $dir -maxdepth 1 -type f -name "zero_m_full.ovf")
	mumax3-convert -omf text $zerofile
	rm $zerofile
	zerofile=$(find $dir -maxdepth 1 -type f -name "zero_m_full.omf")

	for file in `find $dir -maxdepth 1 -type f -name "B_eff_zrange16*.ovf"`	
	do
  		mumax3-convert -omf text $file
		rm $file
	done

	for file in `find $dir -maxdepth 1 -type f -name "B_eff_zrange16*.omf"`
	do
		echo "$file"
		echo " "
		~/go/src/magEditor/manipulations $file $zerofile m
		mumax3-convert -gplot $file
	done
	
	
	
	
	zerofile=$(find $dir -maxdepth 1 -type f -name "zero_m_left.ovf")
	mumax3-convert -omf text $zerofile
	rm $zerofile
	zerofile=$(find $dir -maxdepth 1 -type f -name "zero_m_left.omf")

	for file in `find $dir -maxdepth 1 -type f -name "B_eff_zrange2_*.ovf"`	
	do
  		mumax3-convert -omf text $file
		rm $file
	done

	for file in `find $dir -maxdepth 1 -type f -name "B_eff_zrange2_*.omf"`
	do
		echo "$file"
		echo " "
		~/go/src/magEditor/manipulations $file $zerofile m
		mumax3-convert -gplot $file
	done
	
	
	
	
	zerofile=$(find $dir -maxdepth 1 -type f -name "zero_m_right.ovf")
	mumax3-convert -omf text $zerofile
	rm $zerofile
	zerofile=$(find $dir -maxdepth 1 -type f -name "zero_m_right.omf")

	for file in `find $dir -maxdepth 1 -type f -name "B_eff_zrange29*.ovf"`	
	do
  		mumax3-convert -omf text $file
		rm $file
	done

	for file in `find $dir -maxdepth 1 -type f -name "B_eff_zrange29*.omf"`
	do
		echo "$file"
		echo " "
		~/go/src/magEditor/manipulations $file $zerofile m
		mumax3-convert -gplot $file
	done
	

	
	
	zerofile=$(find $dir -maxdepth 1 -type f -name "zero_m_full_top.ovf")
	mumax3-convert -omf text $zerofile
	rm $zerofile
	zerofile=$(find $dir -maxdepth 1 -type f -name "zero_m_full_top.omf")
	
	for file in `find $dir -maxdepth 1 -type f -name "B_eff_xrange2*.ovf"`	
	do
  		mumax3-convert -omf text $file
		rm $file
	done

	for file in `find $dir -maxdepth 1 -type f -name "B_eff_xrange2*.omf"`
	do
		echo "$file"
		echo " "
		~/go/src/magEditor/manipulations $file $zerofile m
		mumax3-convert -gplot $file
	done
	
	
	
	zerofile=$(find $dir -maxdepth 1 -type f -name "zero_m_full_bot.ovf")
	mumax3-convert -omf text $zerofile
	rm $zerofile
	zerofile=$(find $dir -maxdepth 1 -type f -name "zero_m_full_bot.omf")
	
	for file in `find $dir -maxdepth 1 -type f -name "B_eff_xrange8*.ovf"`	
	do
  		mumax3-convert -omf text $file
		rm $file
	done

	for file in `find $dir -maxdepth 1 -type f -name "B_eff_xrange8*.omf"`
	do
		echo "$file"
		echo " "
		~/go/src/magEditor/manipulations $file $zerofile m
		mumax3-convert -gplot $file
	done
	
done
