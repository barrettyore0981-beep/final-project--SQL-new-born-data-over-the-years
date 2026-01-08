# final-project--SQL-new-born-data-over-the-years
final project for SQL 

# DATA SET
data set retrived from data.gov and can be found here https://catalog.data.gov/dataset/baby-names-from-social-security-card-applications-national-data

the data set is made from goverment data and contains the  quanity of names given to newbornes as well as the year of birth and gender behind the names 

the data spans from 1880-2024 

the data set is formated as a collection of text files for each year each containing a name the gender that name is given to and the occurances of that name under that gender

# REFORMATING DATA

for the data set to be injested into SQL the format of the data set needed to be changed from the orignal format to a CSV file 

this was accomplished with the help of a partially AI generated python script (name data to csv.py) that systematically went through the collection of text files extracting the year from the file name and adding it into a new colum in addition to the already contained data turning the orignal format into a CSV containing all of the data 

# INJTESTING DATA 
the CSV file from the last step was then injesting into a SQL LITE data base using DBEAVER which acted as the main IDE for the project 

# FILE EPLANATIONS  
