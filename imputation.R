library(dplyr)

# working with concentrations (eg. targeted metabolomics data) you often need 
# to impute missing values due to concentration values under the detection 
# limit. The missing values are often imputed with a fixed value (eg. half 
# the detection limit) or (better for mantaining natural variability) a random 
# number between 0 + epsilon and half of the detection limit (here we use 
# minimum instead of detection limit). The check on is.numeric is needed 
# otherwise the factor columns will be "broken".

# starting from here 
# http://stackoverflow.com/questions/42052078/correct-syntax-for-mutate-if 
# http://stackoverflow.com/questions/26081672/change-variable-values-by-groups-using-dplyr

set.seed(1)
mtcars[sample(1:dim(mtcars)[1], 5),
       sample(1:dim(mtcars)[2], 5)] <-  NA

mtcars<-mtcars %>% mutate_if(is.numeric,funs(ifelse(is.na(.),runif(n=1,1e-10,min(., na.rm=TRUE)/2), .)))

