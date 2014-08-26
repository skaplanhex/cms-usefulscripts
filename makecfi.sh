#!/bin/bash
export currentDir=$( pwd -P )
cd $1
export fulldir=$( pwd -P)
cd $currentDir
counter=0
export fname="temp_cfi.py"
echo Creating cfi file "in" the working directory called $fname with files from $fulldir
touch $fname
echo "import FWCore.ParameterSet.Config as cms" > $fname
echo "" >> $fname
echo "source = cms.Source(\"PoolSource\"," >> $fname
for iFile in $( ls $fulldir )
do
	rem=$((counter%250))
	if [ $counter -eq 0 ]
	then
		echo "..."
		echo "    fileNames = cms.untracked.vstring('file:$fulldir/$iFile'," >> $fname
	elif [ $rem -eq 0 ]
	then
		echo "..."
		echo "        'file:$fulldir/$iFile')+cms.untracked.vstring(" >> $fname
	else
		echo "        'file:$fulldir/$iFile'," >> $fname
	fi
	let counter+=1
done
echo "    )" >> $fname
echo ")" >> $fname
echo "done."
