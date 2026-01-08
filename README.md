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

# FILE EXPLANATIONS  
  combined_names.csv.zip  -the reformated data 
  final-project.sql       -the SQL queries for the project
  final_project.db.zip    -the injested SQL LITE data base 
  name data to csv.py     -the automatic python script to reformat the orignal data set to a CSV

# DATA ANALYSIS

I had a few questions I wanted to ask with this data set 


1. what is the most popualar name of recent history
   to ansewr this I grouped each name across all years and sumed the occurances and found that JAMES is the most popular name with 5262396 instances JAMES is shortly followed by JOHN with 5196210 instances

2. what is the most popular female and male name
   as expected JAMES and JOHN show up at the top again for males
   for the females the most popular name with 4139160 instaces is by far MARY with a distant second of elizebeth with 1681878 instances
   I ansewred these questions in the same way as the first except with a addinitol filter for gender

3. what year had the most new borns
   to ansewr this I grouped by year and counting the total occurances of all names per year and found that 1957 was the US MAX for newborns this corrolates with the rough middle of the US baby boom following WW2 (1946-1964) all of the next popular years fall in the same time period correlating with reports of declining birth rates across most first world countries in recent times 

4. what Gender is born more frequently
   to ansewr this I grouped by gender and counted the sum of all occurances and found that the distrubution is mostly equaly but male leaning
   with Male births totalling up to 188075971 and female births 183933179 to check if this distrubtion is real or a bias of the data set i did a google search and found the global rate is around 1.05 males/females and found the rate is rougly close in the US with 1.02 rate males/females

5. how do common names change over decades
   to ansewr this I removed the last digit from every year in the data set and replaced it be zero EX. 1885-> 1880 2012->2010 which provivided me with decade bins i then ranked the occurances of names in the decade bins and selected the most popular name in each bin
  i found that JAMES which was the most popular name was most popular in the 40s and 50s which encapsulates most of the baby boom this combined with the knoledge that male births are more common explains JAMES's popularity we can also see that despite MARY being the most popular girls name it is a older name being popular in the 1880s-1920s birth rates were around the current rate in the begging of that time frame and were higher than now towards the end this shows how MARY became the most popular as well as why there is a large gap between the popularity of MARY and ELIZIBETH despite mary no longer being common today 
