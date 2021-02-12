# Hive-Wikipedia

## Project Description
Hive-Wikipedia is a Hive script that uses some of the data from wikimedia to ananlyze users interactions with the site.

## Technologies Used
HDFS
YARN
MapReduce
Hadoop 2.7.7
Hive 2.3.8

## Features
Some of the features of the project:
  Create tables with the wikipedia data
  Perform analysis to answer questions about user interaction

To-do list:
  Simplify the tables used in question 2 and 3

## Getting Started

For a Linux environment:

git clone https://github.com/ClairHoulihan/Hive-Wikipedia.git

mkdir ~/wikimedia_data

To run the queries, you will need Hadoop, HDFS, YARN and HIVE versions described in technologies used downloaded, and have them running on the system

You will also need to download all of the files used to create the tables into the wikimedia_data directory. Running the bash script in the project will give the files necessary, but they will also need to be unzipped using bunzip2 for the .bz2 files and ginzip2 for the .gz files

Using dbeaver is the best tool for utilizing the queries in this project.

## Usage
After loading all of the data into tables, you can go to the sections for the different questions and run them in order. 
Question 3 needs question 2 in order to function, so if you want to run the query for question 3, you need to create the table from question 2 first.

## License
This project uses the following license: MIT License
