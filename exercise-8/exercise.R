# Exercise 8: Pulitzer Prizes

# Read in the data
pulitzer <- read.csv("/Users/MaryElizabeth/Desktop/INFO 201/m11-dplyr/exercise-8/data/pulitzer-circulation-data.csv", stringsAsFactors = FALSE)

# Install and load the needed libraries
# Be sure to comment out the install.packages function so it won't install it every time it runs
# Remember you only need to install a package once
#install.packages(dplyr)
library(dplyr)

# View in the data set. Start to understand what the data columns contains
# Be sure to comment out the function so it won't view everytime you run the code.
#View(pulitzer)
ncol(pulitzer)
nrow(pulitzer)
dim(pulitzer)
??pulitzer
# Use 'colnames' to print out the names of the columns
print(colnames(pulitzer))

# Use 'str' to print what types of values are contained in each column
# Did any value type surprise you? Why do you think they are that type?
print(str(pulitzer))
# I thought the numbers in the first few would be integers, not characters, but % as characters would make sense,
# I'm not sure about the larger numbers though

# Add a column in a dataframe called 'Pulitzer.Prize.Change` that contains the diffrence in changes
# in Pulitzer Prize Winners from 2004 to 2013 and Pultizer Prize Winners from 1990 to 2003.
Pulitzer.Prize.Change <- mutate(pulitzer, diff.2004.2014.to.1990.2003 = 
                                Pulitzer.Prize.Winners.and.Finalists..2004.2014 -
                                Pulitzer.Prize.Winners.and.Finalists..1990.2003)

# What publication gained the most pulitzer prizes from 2004-2014?
# Be sure to use the pipe operator! 
most.prizes.2014 <- filter(pulitzer, max(Pulitzer.Prize.Winners.and.Finalists..2004.2014) == 
                             Pulitzer.Prize.Winners.and.Finalists..2004.2014) %>% 
                    select(Newspaper)

# Which publication with at least 5 Pulitzers won from 2004-2014 had the biggest decrease(negative) in Daily circulation numbers? 
# This publication should have Pulitzer prizes won a minimum of 5 Pulitzers, as well as the biggest decrease in circulation
most.awarding.decrease <- filter(pulitzer, Pulitzer.Prize.Winners.and.Finalists..2004.2014 >= 5) %>% 
                          filter(min(Change.in.Daily.Circulation..2004.2013) == Change.in.Daily.Circulation..2004.2013) %>% 
                          select(Newspaper)

# Your turn! An important part about being a data scientist is asking questions. 
# Create a question and use dplyr to figure out the answer.  
# Which publication from 2004 to 2013 had the biggest increase in Daily circulation numbers that won at least twice??
biggest.circulation.increase.2014.2013 <- filter(pulitzer, Pulitzer.Prize.Winners.and.Finalists..2004.2014 >= 2) %>% 
                                          filter(max(Change.in.Daily.Circulation..2004.2013) == Change.in.Daily.Circulation..2004.2013) %>%
                                          select(Newspaper)
