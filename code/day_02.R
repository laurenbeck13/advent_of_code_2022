library(dplyr)

data <- read.csv("data/day_02.txt", 
                 header = FALSE, 
                 sep = " ")

result_1 <- data %>%
  dplyr::mutate(points = dplyr::case_when(
    V1 == "A" & V2 == "X" ~ 1 + 3,
    V1 == "A" & V2 == "Y" ~ 2 + 6,
    V1 == "A" & V2 == "Z" ~ 3 + 0,
    V1 == "B" & V2 == "X" ~ 1 + 0,
    V1 == "B" & V2 == "Y" ~ 2 + 3,
    V1 == "B" & V2 == "Z" ~ 3 + 6,
    V1 == "C" & V2 == "X" ~ 1 + 6,
    V1 == "C" & V2 == "Y" ~ 2 + 0,
    V1 == "C" & V2 == "Z" ~ 3 + 3)) %>%
  dplyr::pull(points) %>%
  sum()

result_2 <- data %>%
  dplyr::mutate(points = dplyr::case_when(
    V1 == "A" & V2 == "X" ~ 3 + 0,
    V1 == "A" & V2 == "Y" ~ 1 + 3,
    V1 == "A" & V2 == "Z" ~ 2 + 6,
    V1 == "B" & V2 == "X" ~ 1 + 0,
    V1 == "B" & V2 == "Y" ~ 2 + 3,
    V1 == "B" & V2 == "Z" ~ 3 + 6,
    V1 == "C" & V2 == "X" ~ 2 + 0,
    V1 == "C" & V2 == "Y" ~ 3 + 3,
    V1 == "C" & V2 == "Z" ~ 1 + 6)) %>%
  dplyr::pull(points) %>%
  sum()