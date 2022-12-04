# read test input
day4 <- as.list(readLines("data/test_d4.txt"))
# read input
day4 <- as.list(readLines("data/day4.txt"))

# Part 1
# thinking:  a-b, c-d
# create counter
counter <- 0 
# iterate through each pair
for (team in day4){
  
  # get components for a-b,c-d
  a <- as.numeric(strsplit(strsplit(unlist(team), ",")[[1]][1], "-")[[1]][1])
  print(a)
  b <- as.numeric(strsplit(strsplit(unlist(team), ",")[[1]][1], "-")[[1]][2])
  print(b)
  c <- as.numeric(strsplit(strsplit(unlist(team), ",")[[1]][2], "-")[[1]][1])
  print(c)
  d <- as.numeric(strsplit(strsplit(unlist(team), ",")[[1]][2], "-")[[1]][2])
  print(d)
  
  
  # get logic for when there is overlap
  if((a >=c & b <= d) | (c >= a & d <= b)){

    counter <- counter + 1

  } else {

    # nothing to see here
  }
  
# So I was getting a number that was too large
# turns out I didn't convert back to numeric and it was using lexographic ordering
# i.e. 2 > 10 and 9 > 80, etc
# Below is my debugging code for posterity

  # if(a >=c & b <= d){
  #   print(paste0(a," >= ",c, " and ", b, " <= ", d))
  #   counter <- counter + 1
  #   print(paste0("counter = ", counter))
  # } else if (c >= a & d <= b){
  #   
  #   print(paste0(c," >= ",a, " and ", d, " <= ", b))
  #   counter <- counter + 1
  #   print(paste0("counter = ", counter))
  #   
  # } else {
  #   
  #   print(paste0("not containted, counter = ", counter))
  # }
  
}

print(counter)



# Part 2
# thinking:  a-b, c-d
# same as Part 1 except new logic: b >= c & d >= a or a <=d & b >= c
counter <- 0 
for (team in day4){
  
  a <- as.numeric(strsplit(strsplit(unlist(team), ",")[[1]][1], "-")[[1]][1])

  b <- as.numeric(strsplit(strsplit(unlist(team), ",")[[1]][1], "-")[[1]][2])

  c <- as.numeric(strsplit(strsplit(unlist(team), ",")[[1]][2], "-")[[1]][1])

  d <- as.numeric(strsplit(strsplit(unlist(team), ",")[[1]][2], "-")[[1]][2])
  
  
  
  if((b >= c & d >= a) | (a <=d & b >= c) ){
    
    counter <- counter + 1
    
  } else {
    
    # nothing to see here
  }
}

print(counter)


