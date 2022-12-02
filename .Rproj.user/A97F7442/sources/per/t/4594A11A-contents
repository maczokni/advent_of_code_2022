#read in data
day1 <- as.list(readLines("2022/day1.txt"))

# Part 1

# loop through each element, summing until we reach a blank then reset counter, 
# save sums into a list
datalist <- list()
calories <- 0 
i <- 1
for (thing in day1) {
  
  if (!is.na(as.numeric(thing))){
    #if a number add it to calories count
    calories <- calories + as.numeric(thing)
    
  } else {
    # save total calories
    datalist[i] <- calories
    # reset calories
    calories <- 0 
    # move to next elf
    i <- i+1
    
  }
  
}

# unlist and print largest number (most calories)
max(unlist(datalist))


# Part 2

sum(tail(sort(unlist(datalist)),3))

