#Week 4: dplyr package

#Task: Write the function to get a dataset from Base R: HairEyeColor
#and give the dataset a new name of your choice
HE=data.frame(HairEyeColor)

#See the top rows of the data
#TASK: Write the function to see the top rows of the data
head(HE)

#Install and call the package dplyr
#TASK: Write the functions to install and call dplyr
install.packages("dplyr")
library(dplyr)


#Let's just see the hair and sex columns
#Task: Write the function to 'select' just the hair and sex columns 
#(hint: use the 'select' function)
HE %>% select(Hair,Sex)

#Let's name the dataset with just the two columns, Hair and Sex
#TASK: Write the function to save the two columns as one new dataset
#and give it a name
HE_2d=select(HE,Hair,Sex)
HE_2d

#Let's get rid of the Sex column in the new dataset created above
#TASK: Write the function that deselects the sex column
#(hint: use the 'select' function to not select a -column)
HE_2d %>% select(-Sex)

#Let's rename a column name
#TASK: Write the function that renames 'sex' to 'gender'
HE %>% rename( gender=Sex)


#Let's make a new dataset with the new column name
#TASK: Write the function that names a new dataset that includes the 'gender' column
HE_new=rename(HE,gender=Sex)
HE_new

#Let's 'filter' just the females from our dataset
#TASK: Write the function that includes only rows that are 'female'
fem<-  filter (HE_new, gender=="Female" )
fem
#Let's 'group' our data by gender
#TASK: Write the function to group the data by gender (hint: group_by)
HE_new  %>%  group_by ( gender )

#Let's see how many students were examined in the dataset (total the frequency)
#TASK: replace 'datasetname' with the name of your dataset and get the total
#TASK: After you run it, write the total here:592
total=mutate(HE_new, total=cumsum(Freq))
total

#Since we have a females dataset, let's make a males dataset
#TASK: Write the function that includes only rows that are 'male'
mal<-  filter (HE_new, gender=="Male" )
mal

#And now let's join the males and females
#TASK: Write the function that joins the male and female rows 
#(hint: try using 'union' or 'bind_rows')
union(fem,mal)

#Optional Task: add any of the other functions 
#you learned about from the dplyr package
#mutate function:- Create a new column with operation
mutate(HE_new, Freq + 10)
# Summarise function
HE_new %>% summarise(Freq = mean(Freq, na.rm = TRUE))

