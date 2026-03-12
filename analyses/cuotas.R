setwd("~/Library/CloudStorage/GoogleDrive-suarezmjorge@gmail.com/Otros ordenadores/Mi PC/PhD UGR/GitHub/LSH-LSP/analyses")

library(tidyverse)

ls1 <- read_csv("lsh-lsp1.csv")
ls2 <- read_csv("lsh-lsp2.csv")
ls <- bind_rows(ls1, ls2)

t <- ls %>%
  filter(str_detect(stimulus, 'Gracias por participar') & !is.na(ticket))
table(t$gender)
table(is.na(t$CCAA))

tickets <- t %>% select(ticket)
write_csv(tickets, "tickets.csv")

lsh_lsp1 <- lsh_lsp1 %>%
  mutate(ageParticipant = if_else(str_detect(response, "age"), as.numeric(str_extract(response, "\\d+")), NA),
         ageAgrup = case_when(
           ageParticipant <= 24 ~ "18-24",
           ageParticipant >= 25 & ageParticipant <= 34 ~ "25-34",
           ageParticipant >= 35 & ageParticipant <= 44 ~ "35-44",
           ageParticipant >= 45 & ageParticipant <= 54 ~ "45-54",
           ageParticipant >= 55 & ageParticipant <= 64 ~ "55-64",
           ageParticipant >= 65 ~ "65+",
         ))
table(lsh_lsp1$ageAgrup)




t %>%
  mutate(edad_agrup = case_when())

time <- t %>%
  filter(trial_index ==33) 
(median(time$time_elapsed)/1000)/60

t <- ls %>% filter(remarks!="BORRAR" & trial_index ==33) %>%
  mutate(time_elapsedMIN = (time_elapsed/1000)/60)
summary(t$time_elapsedMIN)
ggplot(t, aes(x=time_elapsedMIN)) +
  geom_histogram(binwidth = 1, color="black", fill="lightblue")
