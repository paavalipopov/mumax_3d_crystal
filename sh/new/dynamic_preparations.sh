#!/bin/bash   

directory="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

for dir in `find $directory -type d -name '*.out'`
do
	cd $dir
	result=${PWD##*/}  

	mkdir "$result width amp"
	mkdir "$result width phase"
	zerofile=$(find $dir -maxdepth 1 -type f -name "ground_B_eff_full.ovf")

	for file in `find $dir -maxdepth 1 -type f -name "B_eff_yrange16*.ovf"`
	do
		echo "$file"
		echo " "
		~/go/src/magEditor/manipulations $file $zerofile m
		mumax3-convert -gplot $file
		mv $file "./$result width phase"
	done
	
	for file in `find $dir -maxdepth 1 -type f -name "B_eff_yrange16*.gplot"`
	do
		mv $file "./$result width amp"
	done
	
	
	

	mkdir "$result len top amp"
	mkdir "$result len top phase"
	zerofile=$(find $dir -maxdepth 1 -type f -name "ground_B_eff_top.ovf")
	
	for file in `find $dir -maxdepth 1 -type f -name "B_eff_xrange40*.ovf"`	
	do
		echo "$file"
		echo " "
		~/go/src/magEditor/manipulations $file $zerofile m
		mumax3-convert -gplot $file
		mv $file "./$result len top phase"
	done
	
	for file in `find $dir -maxdepth 1 -type f -name "B_eff_xrange40*.gplot"`
	do
		mv $file "./$result len top amp"
	done
	
	
	
	
	mkdir "$result len bot amp"
	mkdir "$result len bot phase"
	zerofile=$(find $dir -maxdepth 1 -type f -name "ground_B_eff_bot.ovf")

	for file in `find $dir -maxdepth 1 -type f -name "B_eff_xrange120*.ovf"`
	do
		echo "$file"
		echo " "
		~/go/src/magEditor/manipulations $file $zerofile m
		mumax3-convert -gplot $file
		mv $file "./$result len bot phase"
	done
	
	for file in `find $dir -maxdepth 1 -type f -name "B_eff_xrange120*.gplot"`
	do
		mv $file "./$result len bot amp"
	done

	cd $directory
	
done
