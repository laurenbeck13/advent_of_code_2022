library(dplyr)

data <- read.delim("data/day_06.txt",
                   header = FALSE) %>%
  dplyr::pull(V1)

data_result_1 <- data.frame(character = c(1:nchar(data)),
                            datastream = data) %>%
  dplyr::mutate(signal = substr(datastream, character, character + 3),
                signal_pieces = strsplit(signal, split = NULL))

data_result_1$signal_unique <- Map(unique, data_result_1$signal_pieces)

data_result_1$num_letters <- Map(length, data_result_1$signal_unique)

result_1 <- data_result_1 %>%
  dplyr::filter(num_letters == 4) %>%
  dplyr::slice_min(character) %>%
  dplyr::pull(character) %>%
  sum(3)