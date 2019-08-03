#!/bin/bash
##################################################
# TITLE: CSV Parser
# FILENAME: csvParser.sh
# AUTHOR: Chris Olry
# VERSION:
# DESCRIPTION:
#
##################################################

#############
# Variables #
#############
cdrInput="";
fileINput="";

runScript=true;


#############
# Functions #
#############

parseCSV {
	python - #<< END  # FIX-UNCOMMENT THIS BEFORE RUNNING
	
	import csv # For CSV parsing
	import os # Allows environment variables to be passed between python & bash.
	
	# Get variables from bash
	fileName1 = str(os.environ['cdrInput'])
	fileName2 = str(os.environ['fileInput'])
	fileName3 = str(os.environ['cdrOutput'])
	
	# Set up input and output variables for the script
    cdrFile = open(fileName1, "r")
    fileList = open(fileName2, "r")  
	
    # Set up CSV reader and process the headers
    csvReader = csv.reader(cdrFile)
    header = csvReader.next()
    callIndex = header.index("calldate")
    esrkIndex = header.index("src")
    unidIndex = header.index("uniqueid")
      
    # Make an empty list
    callList = []
    
    # Loop through the lines in the file and get necessary info.
    for row in csvReader:
        dttm = row[callIndex]
        esrk = row[esrkIndex]
        unid = row[unidIndex]
		
		# Write to output file.
		f = open(cdrOutput, "a")
		f.write(dttm + " " + esrk + " " + unid)
    
	# Output new list to temp file.
	
	# Close files
    cdrFile.close()
    fileList.close()
	END
}
#
userInput {
	read -r -p "Enter CDR File or [Q] to quit:" cdrInput
	
	case $cdrInput in
	[Qq])
		runScript = false;
		;;
	esac
	
	read -r -p "Enter filename:" fileInput
	
	# Create CDR Output file.
}
#
compareFiles {
	for line in $cdrFile; do
		if 
	done
}

###########
# RunTime #
###########
while runScript == true; do
	userInput
	parseCSV
	compareFiles
done
#
exit