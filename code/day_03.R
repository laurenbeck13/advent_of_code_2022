library(dplyr)

data <- read.csv("data/day_03.txt", 
                 header = FALSE, 
                 sep = " ")

result_1 <- data %>%
  dplyr::mutate(compartment_1 = substr(V1, 1, nchar(V1) / 2),
                compartment_2 = substr(V1, nchar(V1) / 2 + 1, nchar(V1)),
                list_1 = strsplit(compartment_1, split = NULL),
                list_2 = strsplit(compartment_2, split = NULL))

result_1$common <- Map(intersect, result_1$list_1, result_1$list_2)

result_1$priorty <- match(result_1$common, 
                          c(letters[1:26], 
                            LETTERS[1:26]))