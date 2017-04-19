# Exercise 4: DPLYR and flights data

# Install the nycflights13 package and read it in.  Require the dplyr package
# install.packages("nycflights13")
library(nycflights13)
library(dplyr)

# The data.frame flights should now be accessible to you.  View it, 
# and get some basic information about the number of rows/columns
View(flights)
dim(flights)
nrow(flights)
ncol(flights)
?flights


# Add a column that is the amount of time gained in the air (`arr_delay` - `dep_delay`)
flights <- mutate(flights, gain = 'arr_delay - dep_delay')

# Sort your data.frame desceding by the column you just created
flights <- arrange(flights, desc(gain))

# Try doing the last 2 steps in a single operation using the pipe operator
flights <- flights %>% mutate(gain = 'arr_delay - dep_delay') %>% arrange(desc(gain))

# Make a histogram of the amount of gain using the `hist` command
hist(flights$gain)

# On average, did flights gain or lose time?
mean(flights$gain, na.rm = TRUE) #average of 5 minutes

# Create a data.frame that is of flights headed to seatac ('SEA'), 
to.seattle <- flights %>% select(gain, dest) %>% filter(dest == 'SEA')

# On average, did flights to seatac gain or loose time?
mean(to.seattle$gain, na.rm = TRUE) #average loss of 11.6991 minutes

### Bonus ###
# Write a function that allows you to specify an origin, a destination, and a column of interest
# that returns a data.frame of flights from the origin to the destination and only the column of interest
## Hint: see chapter 11 section on standard evaluation


# Retireve the air_time column for flights from JFK to SEA


# What was the average air time of those flights (in hours)?  
mean(jfk.to.sea$air_time / 60, na.rm = TRUE) # average time of 5.489574 hours

# What was the min/max average air time for the JFK to SEA flights?
min(jfk.to.sea$air_time / 60, na.rm = TRUE) # 4.583
max(jfk.to.sea$air_time / 60, na.rm = TRUE) # 6.483