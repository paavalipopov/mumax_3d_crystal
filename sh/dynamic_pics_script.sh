#!/bin/bash   

directory="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

for dir in `find $directory -type d -name '*.out'`
do

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
	done
	
	
	
	zerofile=$(find $dir -maxdepth 1 -type f -name "zero_m_full_top.ovf")
	mumax3-convert -omf text $zerofile
	rm $zerofile
	zerofile=$(find $dir -maxdepth 1 -type f -name "zero_m_full_top.omf")
	
	for file in `find $dir -maxdepth 1 -type f -name "m_full_xrange4*.ovf"`	
	do
  		mumax3-convert -omf text $file
		rm $file
	done

	for file in `find $dir -maxdepth 1 -type f -name "m_full_xrange4*.omf"`
	do
		echo "$file"
		echo " "
		~/go/src/magEditor/manipulations $file $zerofile m
	done
	
	
	
	zerofile=$(find $dir -maxdepth 1 -type f -name "zero_m_full_bot.ovf")
	mumax3-convert -omf text $zerofile
	rm $zerofile
	zerofile=$(find $dir -maxdepth 1 -type f -name "zero_m_full_bot.omf")
	
	for file in `find $dir -maxdepth 1 -type f -name "m_full_xrange16*.ovf"`	
	do
  		mumax3-convert -omf text $file
		rm $file
	done

	for file in `find $dir -maxdepth 1 -type f -name "m_full_xrange16*.omf"`
	do
		echo "$file"
		echo " "
		~/go/src/magEditor/manipulations $file $zerofile m
	done
	
done
