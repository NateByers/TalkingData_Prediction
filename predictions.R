library(caret)
load("data/models.rda")

region <- c("Beijing", "Chengdu", "Hong Kong", "Rural", "Shanghai")
hour <- 0:23
phone_brand <- c("vivo", "OPPO")
Games <- c(1, 0)
Education <- c(1, 0)
Finance <- c(1, 0)

possible_inputs <- expand.grid(region = region, hour = hour, 
                               phone_brand = phone_brand, Games = Games, 
                               Education = Education, Finance = Finance)

genders <- apply(possible_inputs, 1, function(row){
  prd <- data.frame(region = row[["region"]], hour = as.numeric(row[["hour"]]),
                    phone_brand = row[["phone_brand"]], 
                    Games = as.numeric(row[["Games"]]), 
                    Education = as.numeric(row[["Education"]]),
                    Finance = as.numeric(row[["Finance"]]))
  predict(rf, prd)
})

ages <- apply(possible_inputs, 1, function(row){
  prd <- data.frame(region = row[["region"]], hour = as.numeric(row[["hour"]]),
                    phone_brand = row[["phone_brand"]], 
                    Games = as.numeric(row[["Games"]]), 
                    Education = as.numeric(row[["Education"]]),
                    Finance = as.numeric(row[["Finance"]]))
  predict(lm, prd)
})


possible_inputs$gender <- genders
possible_inputs$age <- ages
save(possible_inputs, file = "data/predictions.rda")
