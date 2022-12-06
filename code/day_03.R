library(dplyr)

data <- read.csv("data/day_03.txt", 
                 header = FALSE, 
                 sep = " ")

data_result_1 <- data %>%
  dplyr::mutate(compartment_1 = substr(V1, 1, nchar(V1) / 2),
                compartment_2 = substr(V1, nchar(V1) / 2 + 1, nchar(V1)),
                list_1 = strsplit(compartment_1, split = NULL),
                list_2 = strsplit(compartment_2, split = NULL))

data_result_1$common <- Map(intersect, data_result_1$list_1, data_result_1$list_2)

data_result_1$priorty <- match(data_result_1$common, 
                          c(letters[1:26], 
                            LETTERS[1:26]))

result_1 <- sum(data_result_1$priorty)

