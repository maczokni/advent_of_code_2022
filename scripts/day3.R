library(dplyr)
#read in data
day3 <- as.list(readLines("data/day3.txt"))

# Part 1 #######################################

# make df
thing <- as.data.frame(do.call(rbind, day3))
names(thing) <- "input"
thing <- thing %>% 
  mutate(first_half = substr(input,1,nchar(input)/2), 
         second_half = substr(input,nchar(input)/2+1, nchar(input))) %>% 
  rowwise() %>% 
  mutate(common_item = unique(list(unlist(strsplit(first_half, ""))[unlist(strsplit(first_half, "")) %in% 
                                                                unlist(strsplit(second_half, ""))])))
# deal with multiple appearances of the common item
thing <- distinct(tidyr::unnest(thing, common_item))

# create lookup table for points
point_lookup <- data.frame(common_item = c(letters, LETTERS), 
                           points = 1:52)  
# attach lookup table for points
final_thing <- left_join(thing, point_lookup)
# get the sum
sum(final_thing$points)

  
# Part 2 #######################################


# iterate through 3 rows at a time

# make list of teams
elf_teams <- paste0(seq(1,nrow(final_thing), 3),":",seq(3,nrow(final_thing), 3))
# prepare loop
datalist <- list()
i <- 1
# for each team find the common item and save to a df
for (team in elf_teams){
  
  team_df <- final_thing[eval(parse(text = team)),]
  
  first_round <- unique(unlist(strsplit(team_df$input[1], ""))[unlist(strsplit(team_df$input[1], "")) %in% 
                                                                 unlist(strsplit(team_df$input[2], ""))])
  
  common_item <- unlist(strsplit(team_df$input[3], ""))[unlist(strsplit(team_df$input[3], "")) 
                                                        %in% first_round]
  
  datalist[[i]] <- data.frame(item = unique(common_item))
  i <- i + 1
  
}
# assemble the df
team_items <- do.call(rbind,datalist)
# attach lookup table for points
final_team_thing <- left_join(team_items, point_lookup, by = c("item" = "common_item"))
# get the sum
sum(final_team_thing$points)
